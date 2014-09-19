require 'rails_helper'

RSpec.describe "custom_fields/index", :type => :view do
  before(:each) do
    assign(:custom_fields, [
      CustomField.create!(
        :field_name => "Field Name",
        :label_name => "Label Name",
        :field_type => "Field Type",
        :asset_id => 1
      ),
      CustomField.create!(
        :field_name => "Field Name",
        :label_name => "Label Name",
        :field_type => "Field Type",
        :asset_id => 1
      )
    ])
  end

  it "renders a list of custom_fields" do
    render
    assert_select "tr>td", :text => "Field Name".to_s, :count => 2
    assert_select "tr>td", :text => "Label Name".to_s, :count => 2
    assert_select "tr>td", :text => "Field Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
