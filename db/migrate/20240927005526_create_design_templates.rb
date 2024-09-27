# db/migrate/20240927005526_create_design_templates.rb
class CreateDesignTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :design_templates do |t|
      t.string :name
      t.text :html_content
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
