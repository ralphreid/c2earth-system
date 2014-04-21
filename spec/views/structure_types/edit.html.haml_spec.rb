require 'spec_helper'

describe "structure_types/edit" do
  before(:each) do
    @structure_type = assign(:structure_type, stub_model(StructureType,
      :structure_type => "MyString"
    ))
  end

  it "renders the edit structure_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", structure_type_path(@structure_type), "post" do
      assert_select "input#structure_type_structure_type[name=?]", "structure_type[structure_type]"
    end
  end
end
