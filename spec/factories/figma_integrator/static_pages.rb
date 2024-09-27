# spec/factories/figma_integrator/static_pages.rb
FactoryBot.define do
  unless FactoryBot.factories.registered?(:static_page)
    factory :static_page, class: 'FigmaIntegrator::StaticPage' do
      account
      sequence(:title) { |n| "Page Title #{n}" }
      sequence(:slug) { |n| "page-slug-#{n}" }
      content { "Page content" }
      published_at { nil }

      trait :published do
        published_at { Time.current }
      end

      trait :with_design_template do
        association :design_template
      end
    end
  end
end
