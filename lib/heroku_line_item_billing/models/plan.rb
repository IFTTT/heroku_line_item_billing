module HerokuLineItemBilling
  class Plan < Base
    attributes :name

    def self.cached_find(*args)
      if @cached && @cached[args.join(':')]
        return @cached[args.join(':')]
      else
        @cached ||= {}
        @cached[args.join(':')] = find(*args)
      end
    end

    def price
      @price ||= Price.new(@json_data["price"]) rescue Price.empty
    end
  end
end