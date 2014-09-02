require "postjoy/version"
require "postjoy/validator" if defined?(ActiveModel)

module Postjoy
  class << self

    def find(postal_code)
      postal_codes[postal_code.to_s]
    end

    def postal_codes
      @postal_codes ||= Marshal.load(File.read("#{File.expand_path("../../postal_codes.dump", __FILE__)}"))
    end

  end
end
