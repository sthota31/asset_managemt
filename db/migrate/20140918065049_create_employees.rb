class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :emp_id
      t.string :email
      t.string :designation
      t.string :location_id
      t.timestamps
    end
  end
end
