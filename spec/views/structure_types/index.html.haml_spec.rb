require 'spec_helper'

describe "structure_types/index" do
  before(:each) do
    assign(:structure_types, [
      stub_model(StructureType,
        :structure_type => "Structure Type"
      ),
      stub_model(StructureType,
        :structure_type => "Structure Type"
      )
    ])
  end

  it "renders a list of structure_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Structure Type".to_s, :count => 2
  end
end
