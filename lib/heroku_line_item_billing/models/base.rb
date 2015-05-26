module HerokuLineItemBilling
  class Base
    extend API

    def initialize(json_object)
      @json_data = json_object
    end

    def self.attributes(*attribute_names)
      @attribute_names = attribute_names
      @attribute_names.each do |name|
        define_method name do
          @json_data[name.to_s]
        end
      end
    end

    def self.attribute_names
      @attribute_names
    end

    def self.all(*args)
      api.send(endpoint).list(*args).map{|json| new(json) }
    end

    def self.find(*args)
      new(api.send(endpoint).info(*args)) rescue new({})
    end

    def self.endpoint
      self.name.demodulize.underscore
    end

    def inspect
      inspection = self.class.attribute_names.map{|name|
        "#{name}: #{attribute_for_inspect(name)}"
      }.compact.join(", ")
      "#<#{self.class} #{inspection}>"
    end

    def attribute_for_inspect(attr_name)
      value = send(attr_name)

      if value.is_a?(String) && value.length > 50
        "#{value[0..50]}...".inspect
      elsif value.is_a?(Date) || value.is_a?(Time)
        %("#{value.to_s(:db)}")
      else
        value.inspect
      end
    end
  end
end