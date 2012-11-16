require "zipsy/version"
require "zipsy/validator" if defined?(ActiveModel)

module Zipsy

  ZIP_CODES = Marshal.load File.read("#{File.expand_path("../zipsy/zip_codes.dump", __FILE__)}")

  def self.find(zip_code)
    ZIP_CODES[zip_code.to_s]
  end

  def self.active?(zip_code)
    (self.find(zip_code) || {})[:decommissioned] == false
  end

end
