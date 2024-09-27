# spec/factories/figma_integrator/accounts.rb
FactoryBot.define do
  unless FactoryBot.factories.registered?(:account)
    factory :account do
      sequence(:name) { |n| "Account #{n}" }
      # Add other necessary attributes
    end
  end
end
