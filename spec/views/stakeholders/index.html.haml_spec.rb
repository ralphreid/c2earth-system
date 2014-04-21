require 'spec_helper'

describe "stakeholders/index" do
  before(:each) do
    assign(:stakeholders, [
      stub_model(Stakeholder,
        :stakeholder_type_id => 1,
        :company_id => 2,
        :name => "Name",
        :client_type_id => "Client Type",
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 3,
        :work_phone => "Work Phone",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :fax_phone => "Fax Phone",
        :email => "Email",
        :address_alternate => "Address Alternate",
        :city_alternate => "City Alternate",
        :state_alternate => "State Alternate",
        :zip_alternate => 4,
        :work_phone_alternate => "Work Phone Alternate",
        :home_phone_alternate => "Home Phone Alternate",
        :cell_phone_alternate => "Cell Phone Alternate",
        :fax_phone_alternate => "Fax Phone Alternate",
        :email_alternate => "Email Alternate",
        :notes => "MyText"
      ),
      stub_model(Stakeholder,
        :stakeholder_type_id => 1,
        :company_id => 2,
        :name => "Name",
        :client_type_id => "Client Type",
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 3,
        :work_phone => "Work Phone",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :fax_phone => "Fax Phone",
        :email => "Email",
        :address_alternate => "Address Alternate",
        :city_alternate => "City Alternate",
        :state_alternate => "State Alternate",
        :zip_alternate => 4,
        :work_phone_alternate => "Work Phone Alternate",
        :home_phone_alternate => "Home Phone Alternate",
        :cell_phone_alternate => "Cell Phone Alternate",
        :fax_phone_alternate => "Fax Phone Alternate",
        :email_alternate => "Email Alternate",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of stakeholders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Client Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "City Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "State Alternate".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Fax Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Email Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
