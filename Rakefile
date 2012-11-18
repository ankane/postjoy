require "bundler/gem_tasks"

# tests
require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
end

# create dump
task :create do
  require "csv"
  require "tzip"

  dir = File.expand_path("..", __FILE__)
  zip_codes = {}

  # read from csv
  CSV.foreach "#{dir}/zip_codes.csv", headers: true do |row|
    zip_code = row["Zipcode"]

    city =
    if row["ZipCodeType"] == "MILITARY"
      row["City"]
    else
      row["City"].split(" ").map {|w| w.capitalize }.join(" ")
    end

    zip_codes[zip_code] = {
      city: city,
      state: row["State"],
      lat: row["Lat"].to_f,
      lng: row["Long"].to_f,
      time_zone: ActiveSupport::TimeZone.find_by_zipcode(zip_code),
      decommissioned: row["Decommisioned"] == "true"
      # estimated_population: row["EstimatedPopulation"].to_i
    }
  end

  # save to file
  File.open("#{dir}/lib/zipsy/zip_codes.dump", "w") do |f|
    Marshal.dump zip_codes, f
  end
end
