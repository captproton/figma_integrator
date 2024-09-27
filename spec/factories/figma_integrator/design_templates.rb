# spec/factories/figma_integrator/design_templates.rb
FactoryBot.define do
  unless FactoryBot.factories.registered?(:design_template)
    factory :design_template, class: 'FigmaIntegrator::DesignTemplate' do
      association :account
      sequence(:name) { |n| "Design Template #{n}" }
    end
  end
end
