require 'spec_helper'

describe "company_types/edit" do
  before(:each) do
    @company_type = assign(:company_type, stub_model(CompanyType,
      :name => "MyString"
    ))
  end

  it "renders the edit company_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_type_path(@company_type), "post" do
      assert_select "input#company_type_company_type[name=?]", "company_type[company_type]"
    end
  end
end
