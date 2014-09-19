# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_field do
    field_name "MyString"
    label_name "MyString"
    field_type "MyString"
    asset_id 1
  end
end
