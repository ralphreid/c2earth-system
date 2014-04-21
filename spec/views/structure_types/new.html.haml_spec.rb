require 'spec_helper'

describe "structure_types/new" do
  before(:each) do
    assign(:structure_type, stub_model(StructureType,
      :structure_type => "MyString"
    ).as_new_record)
  end

  it "renders new structure_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", structure_types_path, "post" do
      assert_select "input#structure_type_structure_type[name=?]", "structure_type[structure_type]"
    end
  end
end
