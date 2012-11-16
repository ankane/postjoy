module ActiveModel
  module Validations
    class ZipCodeValidator < ActiveModel::EachValidator

      def initialize(options)
        options.reverse_merge!(:message => "is not a valid zip code")
        super(options)
      end

      def validate_each(record, attribute, value)
        if !Zipsy.active?(value)
          record.errors.add(attribute, options.fetch(:message), :value => value)
        end
      end
    end
  end
end
