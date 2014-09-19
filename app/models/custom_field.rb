class CustomField < ActiveRecord::Base
  attr_accessible :asset_id, :field_name, :field_value
  belongs_to :asset
end
