require 'rails_helper'

RSpec.describe "employees/index", :type => :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :emp_id => 1,
        :email => "Email",
        :designation => "Designation"
      ),
      Employee.create!(
        :name => "Name",
        :emp_id => 1,
        :email => "Email",
        :designation => "Designation"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Designation".to_s, :count => 2
  end
end
