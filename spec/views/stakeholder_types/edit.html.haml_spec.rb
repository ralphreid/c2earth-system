require 'spec_helper'

describe "stakeholder_types/edit" do
  before(:each) do
    @stakeholder_type = assign(:stakeholder_type, stub_model(StakeholderType,
      :stakeholder_type => "MyString"
    ))
  end

  it "renders the edit stakeholder_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stakeholder_type_path(@stakeholder_type), "post" do
      assert_select "input#stakeholder_type_stakeholder_type[name=?]", "stakeholder_type[stakeholder_type]"
    end
  end
end
