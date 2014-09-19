class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :assigned_by
      t.integer :asset_id
      t.integer :employee_id
      t.integer :location_id

      t.timestamps
    end
  end
end
