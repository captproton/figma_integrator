# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
# This line needs to be changed to point to the dummy application
require File.expand_path('../dummy/config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'
require 'database_cleaner'
require 'shoulda-matchers'

# Load support files
Dir[FigmaIntegrator::Engine.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
FactoryBot.find_definitions

RSpec.configure do |config|
  config.fixture_paths = [ Rails.root.join('spec/fixtures') ]
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # FactoryBot configuration
  config.before(:suite) do
    FactoryBot.definition_file_paths = [ File.expand_path('../factories', __FILE__) ]
    FactoryBot.find_definitions
  end
  config.include FactoryBot::Syntax::Methods

  # Database Cleaner configuration
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed # Load seeds
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Include JumpstartTestHelper
  config.include JumpstartTestHelper

  # ActsAsTenant configuration for tests
  config.before(:each) do
    ActsAsTenant.test_tenant = nil
    ActsAsTenant.current_tenant = nil
  end

  # Set up default tenant for system tests
  config.before(:each, type: :system) do
    ActsAsTenant.current_tenant = FactoryBot.create(:account)
  end
end

# Configure Shoulda Matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
