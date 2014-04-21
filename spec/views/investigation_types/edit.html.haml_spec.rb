require 'spec_helper'

describe "investigation_types/edit" do
  before(:each) do
    @investigation_type = assign(:investigation_type, stub_model(InvestigationType,
      :investigation_type => "MyString"
    ))
  end

  it "renders the edit investigation_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", investigation_type_path(@investigation_type), "post" do
      assert_select "input#investigation_type_investigation_type[name=?]", "investigation_type[investigation_type]"
    end
  end
end
