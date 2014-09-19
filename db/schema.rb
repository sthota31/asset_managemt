# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140919091629) do

  create_table "assets", :force => true do |t|
    t.string   "asset_type"
    t.string   "make"
    t.string   "model"
    t.string   "service_tag"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "model_type"
    t.date     "warranty_start"
    t.date     "warranty_end"
    t.string   "serial_no"
    t.string   "status",         :default => "Not Assigned"
    t.integer  "category_id"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "assigned_by"
    t.integer  "asset_id"
    t.integer  "employee_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "status",      :default => "active"
    t.text     "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "custom_fields", :force => true do |t|
    t.string   "field_name"
    t.text     "field_value"
    t.string   "label_name"
    t.string   "field_type",  :default => "text_field"
    t.integer  "asset_id"
    t.string   "status",      :default => "active"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "emp_id"
    t.string   "email"
    t.string   "designation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "location_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
    t.integer  "employee_id"
    t.string   "location_type"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
