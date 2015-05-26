module HerokuLineItemBilling
  class Price
    def self.empty
      new({"cents" => 0, "unit" => "hour"})
    end

    def initialize(args)
      @cents, @unit = args["cents"], args["unit"]
    end

    def per_unit_of_time(unit_of_time)
      if @unit == "month"
        price_unit = Time.now.end_of_month.day.send(:days)
      else
        price_unit = 1.send(@unit)
      end
      (unit_of_time.to_f / price_unit) * @cents
    end
  end
end