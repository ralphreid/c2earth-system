require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :company_name => "MyString",
      :contact => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :website => "MyText",
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input#company_company_name[name=?]", "company[company_name]"
      assert_select "input#company_contact[name=?]", "company[contact]"
      assert_select "input#company_address[name=?]", "company[address]"
      assert_select "input#company_city[name=?]", "company[city]"
      assert_select "input#company_state[name=?]", "company[state]"
      assert_select "input#company_zip[name=?]", "company[zip]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_fax[name=?]", "company[fax]"
      assert_select "input#company_email[name=?]", "company[email]"
      assert_select "textarea#company_website[name=?]", "company[website]"
      assert_select "textarea#company_notes[name=?]", "company[notes]"
    end
  end
end
