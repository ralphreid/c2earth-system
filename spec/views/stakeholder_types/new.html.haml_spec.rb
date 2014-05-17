require 'spec_helper'

describe "stakeholder_types/new" do
  before(:each) do
    assign(:name, stub_model(StakeholderType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new stakeholder_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stakeholder_types_path, "post" do
      assert_select "input#stakeholder_type_stakeholder_type[name=?]", "stakeholder_type[stakeholder_type]"
    end
  end
end
