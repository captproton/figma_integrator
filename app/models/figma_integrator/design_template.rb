# app/models/figma_integrator/design_template.rb
module FigmaIntegrator
  class DesignTemplate < ApplicationRecord
    belongs_to :account, class_name: FigmaIntegrator.account_class.to_s
    has_many :static_pages

    validates :name, presence: true
    # Add any other validations or associations as needed
  end
end
