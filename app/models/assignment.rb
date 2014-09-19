class Assignment < ActiveRecord::Base
  attr_accessible :asset_id, :assigned_by, :employee_id, :location_id
  belongs_to :employee
  belongs_to :asset
end
