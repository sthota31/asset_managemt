class AddContactToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :contact, :string
  end
end
