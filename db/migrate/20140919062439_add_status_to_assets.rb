class AddStatusToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :status, :string,:default=>'Not Assigned'
  end
end
