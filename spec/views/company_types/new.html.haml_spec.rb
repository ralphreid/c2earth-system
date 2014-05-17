require 'spec_helper'

describe "company_types/new" do
  before(:each) do
    assign(:company_type, stub_model(CompanyType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new company_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_types_path, "post" do
      assert_select "input#company_type_company_type[name=?]", "company_type[company_type]"
    end
  end
end
