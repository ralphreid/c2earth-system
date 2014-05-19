require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "MyString",
      :name_alternate => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :work_phone => "MyString",
      :home_phone => "MyString",
      :cell_phone => "MyString",
      :fax_phone => "MyString",
      :email => "MyString",
      :address_alternate => "MyString",
      :city_alternate => "MyString",
      :state_alternate => "MyString",
      :zip_alternate => "MyString",
      :work_phone_alternate => "MyString",
      :home_phone_alternate => "MyString",
      :cell_phone_alternate => "MyString",
      :fax_phone_alternate => "MyString",
      :email_alternate => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_path(@client), "post" do
      assert_select "input#client_name[name=?]", "client[name]"
      assert_select "input#client_name_alternate[name=?]", "client[name_alternate]"
      assert_select "input#client_address[name=?]", "client[address]"
      assert_select "input#client_city[name=?]", "client[city]"
      assert_select "input#client_state[name=?]", "client[state]"
      assert_select "input#client_zip[name=?]", "client[zip]"
      assert_select "input#client_work_phone[name=?]", "client[work_phone]"
      assert_select "input#client_home_phone[name=?]", "client[home_phone]"
      assert_select "input#client_cell_phone[name=?]", "client[cell_phone]"
      assert_select "input#client_fax_phone[name=?]", "client[fax_phone]"
      assert_select "input#client_email[name=?]", "client[email]"
      assert_select "input#client_address_alternate[name=?]", "client[address_alternate]"
      assert_select "input#client_city_alternate[name=?]", "client[city_alternate]"
      assert_select "input#client_state_alternate[name=?]", "client[state_alternate]"
      assert_select "input#client_zip_alternate[name=?]", "client[zip_alternate]"
      assert_select "input#client_work_phone_alternate[name=?]", "client[work_phone_alternate]"
      assert_select "input#client_home_phone_alternate[name=?]", "client[home_phone_alternate]"
      assert_select "input#client_cell_phone_alternate[name=?]", "client[cell_phone_alternate]"
      assert_select "input#client_fax_phone_alternate[name=?]", "client[fax_phone_alternate]"
      assert_select "input#client_email_alternate[name=?]", "client[email_alternate]"
      assert_select "textarea#client_notes[name=?]", "client[notes]"
    end
  end
end
