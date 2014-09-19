require 'rails_helper'

RSpec.describe "custom_fields/show", :type => :view do
  before(:each) do
    @custom_field = assign(:custom_field, CustomField.create!(
      :field_name => "Field Name",
      :label_name => "Label Name",
      :field_type => "Field Type",
      :asset_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Field Name/)
    expect(rendered).to match(/Label Name/)
    expect(rendered).to match(/Field Type/)
    expect(rendered).to match(/1/)
  end
end
