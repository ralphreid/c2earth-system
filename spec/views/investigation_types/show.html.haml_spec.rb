require 'spec_helper'

describe "investigation_types/show" do
  before(:each) do
    @investigation_type = assign(:investigation_type, stub_model(InvestigationType,
      :investigation_type => "Investigation Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Investigation Type/)
  end
end
