require 'rails_helper'

RSpec.describe "assignments/edit", :type => :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :assigned_by => 1,
      :asset_id => 1,
      :employee_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input#assignment_assigned_by[name=?]", "assignment[assigned_by]"

      assert_select "input#assignment_asset_id[name=?]", "assignment[asset_id]"

      assert_select "input#assignment_employee_id[name=?]", "assignment[employee_id]"

      assert_select "input#assignment_location_id[name=?]", "assignment[location_id]"
    end
  end
end
