ENV["RAILS_ENV"] = "test"

require 'bundler/setup'
require 'activeadmin-poro-decorator'
require 'database_cleaner'

require File.expand_path("../support/dummy/config/environment", __FILE__)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with(:rspec) {|c| c.syntax = :expect}
  config.order = :random

  DatabaseCleaner.strategy = :transaction

  config.around(:each, db: true) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end
