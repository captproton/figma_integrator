# /path/to/figma_integrator/figma_integrator.gemspec
require_relative "lib/figma_integrator/version"

Gem::Specification.new do |spec|
  spec.name        = "figma_integrator"
  spec.version     = FigmaIntegrator::VERSION
  spec.authors     = [ "captproton" ]
  spec.email       = [ "carl@wdwhub.net" ]
  spec.homepage    = "https://github.com/captproton/figma_integrator"
  spec.summary     = "Figma integration for Bravura Pro"
  spec.description = "A Rails engine for integrating Figma with the Bravura Pro platform"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/captproton/figma_integrator"
  spec.metadata["changelog_uri"] = "https://github.com/captproton/figma_integrator/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.0"
  spec.add_dependency "friendly_id", "~> 5.5.0"
  spec.add_dependency "acts_as_tenant"
  spec.add_dependency "omniauth-figma"  # Assuming there's a Figma API gem
  spec.add_dependency "pundit"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "cucumber-rails"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "shoulda-matchers"
end
