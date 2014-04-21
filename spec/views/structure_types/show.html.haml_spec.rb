require 'spec_helper'

describe "structure_types/show" do
  before(:each) do
    @structure_type = assign(:structure_type, stub_model(StructureType,
      :structure_type => "Structure Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Structure Type/)
  end
end
