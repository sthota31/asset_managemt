require 'rails_helper'

RSpec.describe "assignments/show", :type => :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :assigned_by => 1,
      :asset_id => 2,
      :employee_id => 3,
      :location_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
