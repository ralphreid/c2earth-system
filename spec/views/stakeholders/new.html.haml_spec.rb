require 'spec_helper'

describe "stakeholders/new" do
  before(:each) do
    assign(:stakeholder, stub_model(Stakeholder,
      :stakeholder_type_id => 1,
      :company_id => 1,
      :name => "MyString",
      :client_type_id => "MyString",
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :work_phone => "MyString",
      :home_phone => "MyString",
      :cell_phone => "MyString",
      :fax_phone => "MyString",
      :email => "MyString",
      :address_alternate => "MyString",
      :city_alternate => "MyString",
      :state_alternate => "MyString",
      :zip_alternate => 1,
      :work_phone_alternate => "MyString",
      :home_phone_alternate => "MyString",
      :cell_phone_alternate => "MyString",
      :fax_phone_alternate => "MyString",
      :email_alternate => "MyString",
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new stakeholder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stakeholders_path, "post" do
      assert_select "input#stakeholder_stakeholder_type_id[name=?]", "stakeholder[stakeholder_type_id]"
      assert_select "input#stakeholder_company_id[name=?]", "stakeholder[company_id]"
      assert_select "input#stakeholder_name[name=?]", "stakeholder[name]"
      assert_select "input#stakeholder_client_type_id[name=?]", "stakeholder[client_type_id]"
      assert_select "input#stakeholder_name[name=?]", "stakeholder[name]"
      assert_select "input#stakeholder_address[name=?]", "stakeholder[address]"
      assert_select "input#stakeholder_city[name=?]", "stakeholder[city]"
      assert_select "input#stakeholder_state[name=?]", "stakeholder[state]"
      assert_select "input#stakeholder_zip[name=?]", "stakeholder[zip]"
      assert_select "input#stakeholder_work_phone[name=?]", "stakeholder[work_phone]"
      assert_select "input#stakeholder_home_phone[name=?]", "stakeholder[home_phone]"
      assert_select "input#stakeholder_cell_phone[name=?]", "stakeholder[cell_phone]"
      assert_select "input#stakeholder_fax_phone[name=?]", "stakeholder[fax_phone]"
      assert_select "input#stakeholder_email[name=?]", "stakeholder[email]"
      assert_select "input#stakeholder_address_alternate[name=?]", "stakeholder[address_alternate]"
      assert_select "input#stakeholder_city_alternate[name=?]", "stakeholder[city_alternate]"
      assert_select "input#stakeholder_state_alternate[name=?]", "stakeholder[state_alternate]"
      assert_select "input#stakeholder_zip_alternate[name=?]", "stakeholder[zip_alternate]"
      assert_select "input#stakeholder_work_phone_alternate[name=?]", "stakeholder[work_phone_alternate]"
      assert_select "input#stakeholder_home_phone_alternate[name=?]", "stakeholder[home_phone_alternate]"
      assert_select "input#stakeholder_cell_phone_alternate[name=?]", "stakeholder[cell_phone_alternate]"
      assert_select "input#stakeholder_fax_phone_alternate[name=?]", "stakeholder[fax_phone_alternate]"
      assert_select "input#stakeholder_email_alternate[name=?]", "stakeholder[email_alternate]"
      assert_select "textarea#stakeholder_notes[name=?]", "stakeholder[notes]"
    end
  end
end
