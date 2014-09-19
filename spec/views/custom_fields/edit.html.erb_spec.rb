require 'rails_helper'

RSpec.describe "custom_fields/edit", :type => :view do
  before(:each) do
    @custom_field = assign(:custom_field, CustomField.create!(
      :field_name => "MyString",
      :label_name => "MyString",
      :field_type => "MyString",
      :asset_id => 1
    ))
  end

  it "renders the edit custom_field form" do
    render

    assert_select "form[action=?][method=?]", custom_field_path(@custom_field), "post" do

      assert_select "input#custom_field_field_name[name=?]", "custom_field[field_name]"

      assert_select "input#custom_field_label_name[name=?]", "custom_field[label_name]"

      assert_select "input#custom_field_field_type[name=?]", "custom_field[field_type]"

      assert_select "input#custom_field_asset_id[name=?]", "custom_field[asset_id]"
    end
  end
end
