class AddFieldsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :status, :string ,:defaults => 'Active'
    add_column :locations, :employee_id, :integer
    add_column :locations, :location_type, :string
  end
end
