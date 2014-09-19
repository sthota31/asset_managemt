class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :field_name
      t.text   :field_value
      t.string :label_name
      t.string :field_type, :default=>"text_field"
      t.integer :asset_id
      t.string  :status, :default=>"active"

      t.timestamps
    end
  end
end
