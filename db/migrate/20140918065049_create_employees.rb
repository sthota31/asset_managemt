class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :emp_id
      t.string :email
      t.string :designation

      t.timestamps
    end
  end
end
