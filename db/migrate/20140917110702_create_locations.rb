class CreateLocations < ActiveRecord::Migration
   def self.up
       create_table :locations do |t|
      t.string :name
      t.integer :location_id
      t.string :location_code
      t.string :location_type
      t.timestamps

    end

["B0","B1","B2","E3","D3","D4"].each do | location|

  Location.create(:name=>location,:location_id=>"0",:location_type=>'Floor')
      end

  end


    def self.down
        drop_table :locations
    end

end
