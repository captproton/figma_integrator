# spec/dummy/config/routes.rb
Rails.application.routes.draw do
  mount FigmaIntegrator::Engine => "/figma_integrator"
end
