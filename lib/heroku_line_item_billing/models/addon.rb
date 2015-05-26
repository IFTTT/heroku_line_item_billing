module HerokuLineItemBilling
  class Addon < Base
    attributes :plan_name

    def plan_name
      @json_data["plan"]["name"]
    end

    def plan
      @plan ||= Plan.cached_find(*plan_name.split(':'))
    end

    def price_per_unit_of_time(unit_of_time)
      plan.price.per_unit_of_time(unit_of_time)
    end
  end
end