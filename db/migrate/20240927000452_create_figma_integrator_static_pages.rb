# db/migrate/20240927000452_create_figma_integrator_static_pages.rb
class CreateFigmaIntegratorStaticPages < ActiveRecord::Migration[7.2]
  def change
    create_table :figma_integrator_static_pages do |t|
      t.references :account, null: false, foreign_key: true
      t.references :design_template, null: true, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content
      t.datetime :published_at

      t.timestamps
    end

    add_index :figma_integrator_static_pages, [ :account_id, :slug ], unique: true
  end
end
