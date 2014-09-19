require 'rails_helper'

RSpec.describe "assets/new", :type => :view do
  before(:each) do
    assign(:asset, Asset.new(
      :asst_type => "MyString",
      :make => "MyString",
      :model => "MyString",
      :service_tag => "MyString"
    ))
  end

  it "renders new asset form" do
    render

    assert_select "form[action=?][method=?]", assets_path, "post" do

      assert_select "input#asset_asst_type[name=?]", "asset[asst_type]"

      assert_select "input#asset_make[name=?]", "asset[make]"

      assert_select "input#asset_model[name=?]", "asset[model]"

      assert_select "input#asset_service_tag[name=?]", "asset[service_tag]"
    end
  end
end
