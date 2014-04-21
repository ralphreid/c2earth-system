require 'spec_helper'

describe "investigation_types/index" do
  before(:each) do
    assign(:investigation_types, [
      stub_model(InvestigationType,
        :investigation_type => "Investigation Type"
      ),
      stub_model(InvestigationType,
        :investigation_type => "Investigation Type"
      )
    ])
  end

  it "renders a list of investigation_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Investigation Type".to_s, :count => 2
  end
end
