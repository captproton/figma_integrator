# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_27_195135) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_templates", force: :cascade do |t|
    t.string "name"
    t.text "html_content"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "account_id" ], name: "index_design_templates_on_account_id"
  end

  create_table "figma_integrator_design_templates", force: :cascade do |t|
    t.string "name"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "account_id" ], name: "index_figma_integrator_design_templates_on_account_id"
  end

  create_table "figma_integrator_static_pages", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "design_template_id"
    t.string "title", null: false
    t.string "slug", null: false
    t.text "content"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "account_id", "slug" ], name: "index_figma_integrator_static_pages_on_account_id_and_slug", unique: true
    t.index [ "account_id" ], name: "index_figma_integrator_static_pages_on_account_id"
    t.index [ "design_template_id" ], name: "index_figma_integrator_static_pages_on_design_template_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index [ "slug", "sluggable_type", "scope" ], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index [ "slug", "sluggable_type" ], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index [ "sluggable_type", "sluggable_id" ], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  add_foreign_key "design_templates", "accounts"
  add_foreign_key "figma_integrator_design_templates", "accounts"
  add_foreign_key "figma_integrator_static_pages", "accounts"
  add_foreign_key "figma_integrator_static_pages", "design_templates"
end
