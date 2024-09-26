Rails.application.routes.draw do
  mount FigmaIntegrator::Engine => "/figma_integrator"
end
