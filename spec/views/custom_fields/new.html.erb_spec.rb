require 'rails_helper'

RSpec.describe "custom_fields/new", :type => :view do
  before(:each) do
    assign(:custom_field, CustomField.new(
      :field_name => "MyString",
      :label_name => "MyString",
      :field_type => "MyString",
      :asset_id => 1
    ))
  end

  it "renders new custom_field form" do
    render

    assert_select "form[action=?][method=?]", custom_fields_path, "post" do

      assert_select "input#custom_field_field_name[name=?]", "custom_field[field_name]"

      assert_select "input#custom_field_label_name[name=?]", "custom_field[label_name]"

      assert_select "input#custom_field_field_type[name=?]", "custom_field[field_type]"

      assert_select "input#custom_field_asset_id[name=?]", "custom_field[asset_id]"
    end
  end
end
