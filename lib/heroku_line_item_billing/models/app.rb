module HerokuLineItemBilling
  class App < Base
    attributes :name

    def formations
      @formations ||= Formation.all(name)
    end

    def addons
      @addons ||= Addon.all(name)
    end

    def config_vars
      @config_vars ||= ConfigVar.find(name)
    end

    def one_free_dyno_per_unit_of_time(unit_of_time)
      if formations.detect{|f|f.size == "1x"}
        Formation.new("size" => "1x", "quantity" => 1).price_per_unit_of_time(unit_of_time) * -1
      else
        0
      end
    end

    def self.line_item_headers
      [
        "productname",
        "cost",
        "user:project",
        "user:environment",
        "usagestartdate",
        "usageenddate"
      ]
    end

    def line_items(unit_of_time)
      app_credit = [[
        "heroku:dyno:legacy-free",
        one_free_dyno_per_unit_of_time(unit_of_time) / 100.to_f
      ]]
      formation_line_items = formations.map do |formation|
        [
          "heroku:dyno:#{formation.type}",
          formation.price_per_unit_of_time(unit_of_time) / 100.to_f
        ]
      end
      addons_line_items = addons.map do |addon|
        [
          "heroku:addon:#{addon.plan.name}",
          addon.price_per_unit_of_time(unit_of_time) / 100.to_f
        ]
      end

      (app_credit + formation_line_items + addons_line_items).map do |item|
        item + [
          config_vars.TAG_PROJECT || name,
          config_vars.TAG_ENVIRONMENT || "production",
          Time.now.strftime("%Y-%m-%d %H:00:00"),
          Time.now.strftime("%Y-%m-%d %H:59:59")
        ]
      end
    end
  end
end