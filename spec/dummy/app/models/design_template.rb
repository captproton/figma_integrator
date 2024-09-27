# spec/dummy/app/models/design_template.rb
class DesignTemplate < ApplicationRecord
  belongs_to :account
  has_many :static_pages
end
