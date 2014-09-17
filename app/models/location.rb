class Location < ActiveRecord::Base
  attr_accessible :location_code, :name, :location_id, :user_id, :user_name
  # LOCATIONS = ["B0","B1","B2","E3","D3","D4"]
  belongs_to :floor, class_name: "Location",
                          foreign_key: "location_id"
  scope :floors ,:conditions=>"location_id = 0"
 validates :name,:presence => true
end
