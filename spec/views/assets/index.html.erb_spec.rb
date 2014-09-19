require 'rails_helper'

RSpec.describe "assets/index", :type => :view do
  before(:each) do
    assign(:assets, [
      Asset.create!(
        :asst_type => "Asst Type",
        :make => "Make",
        :model => "Model",
        :service_tag => "Service Tag"
      ),
      Asset.create!(
        :asst_type => "Asst Type",
        :make => "Make",
        :model => "Model",
        :service_tag => "Service Tag"
      )
    ])
  end

  it "renders a list of assets" do
    render
    assert_select "tr>td", :text => "Asst Type".to_s, :count => 2
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Service Tag".to_s, :count => 2
  end
end
