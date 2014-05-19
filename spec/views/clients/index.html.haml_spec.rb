require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :name_alternate => "Name Alternate",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :work_phone => "Work Phone",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :fax_phone => "Fax Phone",
        :email => "Email",
        :address_alternate => "Address Alternate",
        :city_alternate => "City Alternate",
        :state_alternate => "State Alternate",
        :zip_alternate => "Zip Alternate",
        :work_phone_alternate => "Work Phone Alternate",
        :home_phone_alternate => "Home Phone Alternate",
        :cell_phone_alternate => "Cell Phone Alternate",
        :fax_phone_alternate => "Fax Phone Alternate",
        :email_alternate => "Email Alternate",
        :notes => "MyText"
      ),
      stub_model(Client,
        :name => "Name",
        :name_alternate => "Name Alternate",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :work_phone => "Work Phone",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :fax_phone => "Fax Phone",
        :email => "Email",
        :address_alternate => "Address Alternate",
        :city_alternate => "City Alternate",
        :state_alternate => "State Alternate",
        :zip_alternate => "Zip Alternate",
        :work_phone_alternate => "Work Phone Alternate",
        :home_phone_alternate => "Home Phone Alternate",
        :cell_phone_alternate => "Cell Phone Alternate",
        :fax_phone_alternate => "Fax Phone Alternate",
        :email_alternate => "Email Alternate",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "City Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "State Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Fax Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Email Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
