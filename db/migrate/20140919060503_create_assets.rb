class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_type
      t.string :make
      t.string :model
      t.string :service_tag

      t.timestamps
    end
  end
end
