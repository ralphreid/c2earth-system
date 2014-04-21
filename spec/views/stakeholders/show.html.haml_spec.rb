require 'spec_helper'

describe "stakeholders/show" do
  before(:each) do
    @stakeholder = assign(:stakeholder, stub_model(Stakeholder,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Name/)
    rendered.should match(/Client Type/)
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/3/)
    rendered.should match(/Work Phone/)
    rendered.should match(/Home Phone/)
    rendered.should match(/Cell Phone/)
    rendered.should match(/Fax Phone/)
    rendered.should match(/Email/)
    rendered.should match(/Address Alternate/)
    rendered.should match(/City Alternate/)
    rendered.should match(/State Alternate/)
    rendered.should match(/4/)
    rendered.should match(/Work Phone Alternate/)
    rendered.should match(/Home Phone Alternate/)
    rendered.should match(/Cell Phone Alternate/)
    rendered.should match(/Fax Phone Alternate/)
    rendered.should match(/Email Alternate/)
    rendered.should match(/MyText/)
  end
end
