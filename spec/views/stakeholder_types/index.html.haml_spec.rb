require 'spec_helper'

describe "stakeholder_types/index" do
  before(:each) do
    assign(:stakeholder_types, [
      stub_model(StakeholderType,
        :stakeholder_type => "Stakeholder Type"
      ),
      stub_model(StakeholderType,
        :stakeholder_type => "Stakeholder Type"
      )
    ])
  end

  it "renders a list of stakeholder_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Stakeholder Type".to_s, :count => 2
  end
end
