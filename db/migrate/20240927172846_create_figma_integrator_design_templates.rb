# db/migrate/20240927172846_create_figma_integrator_design_templates.rb
class CreateFigmaIntegratorDesignTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :figma_integrator_design_templates do |t|
      t.string :name
      t.references :account, foreign_key: { to_table: FigmaIntegrator.account_class.table_name }

      t.timestamps
    end
  end
end
