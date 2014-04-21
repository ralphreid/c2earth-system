require 'spec_helper'

describe "sites/edit" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :number => "MyString",
      :structure_type_id => 1,
      :address => "MyString",
      :city => "MyString",
      :county => "MyString",
      :loc_page => "MyText",
      :loc_longitude => "9.99",
      :loc_latitude => "9.99",
      :apn => "MyString",
      :tombrobox => "MyString",
      :fault_id => 1
    ))
  end

  it "renders the edit site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", site_path(@site), "post" do
      assert_select "input#site_number[name=?]", "site[number]"
      assert_select "input#site_structure_type_id[name=?]", "site[structure_type_id]"
      assert_select "input#site_address[name=?]", "site[address]"
      assert_select "input#site_city[name=?]", "site[city]"
      assert_select "input#site_county[name=?]", "site[county]"
      assert_select "textarea#site_loc_page[name=?]", "site[loc_page]"
      assert_select "input#site_loc_longitude[name=?]", "site[loc_longitude]"
      assert_select "input#site_loc_latitude[name=?]", "site[loc_latitude]"
      assert_select "input#site_apn[name=?]", "site[apn]"
      assert_select "input#site_tombrobox[name=?]", "site[tombrobox]"
      assert_select "input#site_fault_id[name=?]", "site[fault_id]"
    end
  end
end
