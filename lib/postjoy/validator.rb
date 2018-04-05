module ActiveModel
  module Validations
    class PostalCodeValidator < ActiveModel::EachValidator

      def initialize(options)
        options.reverse_merge!(message: "is invalid")
        super(options)
      end

      def validate_each(record, attribute, value)
        unless Postjoy.find(sanitized(value))
          record.errors.add(attribute, options.fetch(:message), value: value)
        end
      end

      private

      def sanitized(value)
        return value if options[:allow_extended] != true
        value.to_s.split('-').first
      end
    end
  end
end
