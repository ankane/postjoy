require "bundler/gem_tasks"
require "rake/testtask"

task :default => :test
Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
end

task :create do
  require "csv"

  dir = File.expand_path("..", __FILE__)
  postal_codes = {}

  # read from csv
  CSV.foreach "#{dir}/US.txt", col_sep: "\t" do |row|
    postal_codes[row[1]] = {
      city: row[2],
      state: row[3],
      state_code: row[4],
      latitude: row[9].to_f,
      longitude: row[10].to_f
    }
  end

  # save to file
  File.open("#{dir}/postal_codes.dump", "w") do |f|
    Marshal.dump postal_codes, f
  end
end
