# lib/figma_integrator/engine.rb
require "acts_as_tenant"

module FigmaIntegrator
  class Engine < ::Rails::Engine
    isolate_namespace FigmaIntegrator

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end

    initializer "figma_integrator.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ActsAsTenant::ControllerExtensions
      end
    end

    config.to_prepare do
      FigmaIntegrator.account_class = "Account"
    end

    config.autoload_paths += %W[#{config.root}/app/models]
  end
end

module FigmaIntegrator
  mattr_accessor :account_class

  def self.account_class
    @@account_class.constantize
  end
end
