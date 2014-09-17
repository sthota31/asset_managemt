class CreateLocations < ActiveRecord::Migration
   def self.up
       create_table :locations do |t|
      t.string :name
      t.integer :location_id
      t.string :location_code
      t.string :user_name
      t.integer :user_id
      t.timestamps

    end

["B0","B1","B2","E3","D3","D4"].each do | location|

  Location.create(:name=>location,:location_id=>"0")
      end

  end


    def self.down
        drop_table :locations
    end

end