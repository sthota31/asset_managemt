require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :status => "Status"
      ),
      Category.create!(
        :name => "Name",
        :status => "Status"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
