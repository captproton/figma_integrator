module FigmaIntegrator
  class StaticPage < ApplicationRecord
    extend FriendlyId
    acts_as_tenant(:account)

    belongs_to :account, class_name: FigmaIntegrator.account_class.to_s
    belongs_to :design_template, optional: true

    validates :title, presence: true
    validates :content, presence: true

    friendly_id :title, use: [ :slugged, :scoped ], scope: :account_id

    scope :published, -> { where.not(published_at: nil) }
    scope :draft, -> { where(published_at: nil) }

    def publish
      update(published_at: Time.current)
    end

    def unpublish
      update(published_at: nil)
    end

    def published?
      published_at.present?
    end

    def should_generate_new_friendly_id?
      title_changed? || super
    end
  end
end
