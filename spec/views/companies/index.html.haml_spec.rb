require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :company_name => "Company Name",
        :contact => "Contact",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :website => "MyText",
        :notes => "MyText"
      ),
      stub_model(Company,
        :company_name => "Company Name",
        :contact => "Contact",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :website => "MyText",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
