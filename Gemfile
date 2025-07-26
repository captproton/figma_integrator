source "https://rubygems.org"

# Specify your gem's dependencies in figma_integrator.gemspec.
gemspec

gem "puma"

gem "sqlite3"

gem "sprockets-rails"

group :test do
  gem "cucumber-rails", ">= 3.0.1", require: false
# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false
  # other test gems...
end

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

gem "omniauth-figma", "~> 1.0"
group :test do
  gem "rspec-rails", ">= 7.0.2"
  gem "factory_bot_rails", ">= 6.4.4"
  gem "database_cleaner"
  gem "shoulda-matchers"
end
