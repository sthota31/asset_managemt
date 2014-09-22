class AddFieldsToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :model_type, :string
    add_column :assets, :purchase_date, :date
    add_column :assets, :warranty_date, :date
    add_column :assets, :uniqasset_id, :string
    add_column :assets, :vendor_name, :string
    add_column :assets, :name, :string
  end
end
