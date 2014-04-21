require 'spec_helper'

describe "stakeholder_types/show" do
  before(:each) do
    @stakeholder_type = assign(:stakeholder_type, stub_model(StakeholderType,
      :stakeholder_type => "Stakeholder Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Stakeholder Type/)
  end
end
