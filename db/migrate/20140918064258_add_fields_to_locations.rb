class AddFieldsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :status, :string ,:defaults => 'Active'
    add_column :locations, :assigned, :string ,:defaults => 'Not assigned'
  end
end
