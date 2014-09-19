# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    assigned_by 1
    asset_id 1
    employee_id 1
    location_id 1
  end
end
