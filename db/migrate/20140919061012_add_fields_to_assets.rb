class AddFieldsToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :model_type, :string
    add_column :assets, :warranty_start, :date
    add_column :assets, :warranty_end, :date
    add_column :assets, :serial_no, :string
  end
end
