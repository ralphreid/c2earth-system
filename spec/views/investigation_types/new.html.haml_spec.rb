require 'spec_helper'

describe "investigation_types/new" do
  before(:each) do
    assign(:investigation_type, stub_model(InvestigationType,
      :investigation_type => "MyString"
    ).as_new_record)
  end

  it "renders new investigation_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", investigation_types_path, "post" do
      assert_select "input#investigation_type_investigation_type[name=?]", "investigation_type[investigation_type]"
    end
  end
end
