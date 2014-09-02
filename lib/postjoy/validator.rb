module ActiveModel
  module Validations
    class PostalCodeValidator < ActiveModel::EachValidator

      def initialize(options)
        options.reverse_merge!(message: "is invalid")
        super(options)
      end

      def validate_each(record, attribute, value)
        if !Postjoy.find(value)
          record.errors.add(attribute, options.fetch(:message), value: value)
        end
      end
    end
  end
end
