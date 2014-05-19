require 'spec_helper'

describe "clients/show" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Name Alternate/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Work Phone/)
    rendered.should match(/Home Phone/)
    rendered.should match(/Cell Phone/)
    rendered.should match(/Fax Phone/)
    rendered.should match(/Email/)
    rendered.should match(/Address Alternate/)
    rendered.should match(/City Alternate/)
    rendered.should match(/State Alternate/)
    rendered.should match(/Zip Alternate/)
    rendered.should match(/Work Phone Alternate/)
    rendered.should match(/Home Phone Alternate/)
    rendered.should match(/Cell Phone Alternate/)
    rendered.should match(/Fax Phone Alternate/)
    rendered.should match(/Email Alternate/)
    rendered.should match(/MyText/)
  end
end
