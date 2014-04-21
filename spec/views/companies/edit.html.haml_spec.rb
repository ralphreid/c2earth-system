require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
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
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
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
