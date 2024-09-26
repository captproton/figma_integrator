module FigmaIntegrator
  class Engine < ::Rails::Engine
    isolate_namespace FigmaIntegrator

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end

    initializer "figma_integrator.set_tenant" do |app|
      ActiveSupport.on_load(:action_controller) do
        include ActsAsTenant::ControllerExtensions
      end
    end
  end
end
