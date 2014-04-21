require 'spec_helper'

describe "faults/index" do
  before(:each) do
    assign(:faults, [
      stub_model(Fault,
        :name => "Name"
      ),
      stub_model(Fault,
        :name => "Name"
      )
    ])
  end

  it "renders a list of faults" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
