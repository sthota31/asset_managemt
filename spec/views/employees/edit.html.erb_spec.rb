require 'rails_helper'

RSpec.describe "employees/edit", :type => :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      :name => "MyString",
      :emp_id => 1,
      :email => "MyString",
      :designation => "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input#employee_name[name=?]", "employee[name]"

      assert_select "input#employee_emp_id[name=?]", "employee[emp_id]"

      assert_select "input#employee_email[name=?]", "employee[email]"

      assert_select "input#employee_designation[name=?]", "employee[designation]"
    end
  end
end
