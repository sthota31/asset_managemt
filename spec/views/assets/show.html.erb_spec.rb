require 'rails_helper'

RSpec.describe "assets/show", :type => :view do
  before(:each) do
    @asset = assign(:asset, Asset.create!(
      :asst_type => "Asst Type",
      :make => "Make",
      :model => "Model",
      :service_tag => "Service Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Asst Type/)
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Service Tag/)
  end
end
