require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :number => "Number",
        :structure_type_id => 1,
        :address => "Address",
        :city => "City",
        :county => "County",
        :loc_page => "MyText",
        :loc_longitude => "9.99",
        :loc_latitude => "9.99",
        :apn => "Apn",
        :tombrobox => "Tombrobox",
        :fault_id => 2
      ),
      stub_model(Site,
        :number => "Number",
        :structure_type_id => 1,
        :address => "Address",
        :city => "City",
        :county => "County",
        :loc_page => "MyText",
        :loc_longitude => "9.99",
        :loc_latitude => "9.99",
        :apn => "Apn",
        :tombrobox => "Tombrobox",
        :fault_id => 2
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Apn".to_s, :count => 2
    assert_select "tr>td", :text => "Tombrobox".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
