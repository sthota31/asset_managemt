class Category < ActiveRecord::Base
  attr_accessible :name, :description,:status
  has_many :assets
end
