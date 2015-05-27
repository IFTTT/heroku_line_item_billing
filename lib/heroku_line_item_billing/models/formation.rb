module HerokuLineItemBilling
  class Formation < Base
    PRICES = {
      "1x" => {"cents" => 5, "unit" => "hour"},
      "2x" => {"cents" => 10, "unit" => "hour"},
      "px" => {"cents" => 80, "unit" => "hour"},
      "standard-1x" => {"cents" => 2500, "unit" => "month"},
      "standard-2x" => {"cents" => 5000, "unit" => "month"},
      "performance" => {"cents" => 50000, "unit" => "month"},
      "hobby" => {"cents" => 700, "unit" => "month"},
      "free" => {"cents" => 0, "unit" => "month"}
    }

    attributes :size, :quantity, :type

    def size
      @json_data["size"].downcase
    end

    def price
      @price ||= Price.new(PRICES[size])
    end

    def price_per_unit_of_time(unit_of_time)
      price.per_unit_of_time(unit_of_time) * quantity
    end
  end
end