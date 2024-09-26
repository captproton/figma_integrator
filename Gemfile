source "https://rubygems.org"

# Specify your gem's dependencies in figma_integrator.gemspec.
gemspec

gem "puma"

gem "sqlite3"

gem "sprockets-rails"

group :test do
  gem "cucumber-rails", require: false
# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false
  # other test gems...
end

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

gem "omniauth-figma", "~> 1.0"
group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "shoulda-matchers"
end
