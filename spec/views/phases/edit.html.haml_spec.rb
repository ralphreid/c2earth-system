require 'spec_helper'

describe "phases/edit" do
  before(:each) do
    @phase = assign(:phase, stub_model(Phase,
      :phase => "MyString",
      :project_id => 1,
      :company_id => 1,
      :project_manager_id => 1,
      :investigation_type_id => "MyString",
      :site_id => 1,
      :stakeholder_id => 1,
      :description => "MyText",
      :proposal_number => "MyString",
      :notes => "MyText",
      :insurance_policy_number => "MyString",
      :insurance_notes => "MyText",
      :bill_name => "MyString",
      :bill_attention => "MyString",
      :bill_address => "MyString",
      :bill_city => "MyString",
      :bill_state => "MyString",
      :bill_zip => "MyString",
      :bad_pay_history => "MyText",
      :keywords => "MyString"
    ))
  end

  it "renders the edit phase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phase_path(@phase), "post" do
      assert_select "input#phase_phase[name=?]", "phase[phase]"
      assert_select "input#phase_project_id[name=?]", "phase[project_id]"
      assert_select "input#phase_company_id[name=?]", "phase[company_id]"
      assert_select "input#phase_project_manager_id[name=?]", "phase[project_manager_id]"
      assert_select "input#phase_investigation_type_id[name=?]", "phase[investigation_type_id]"
      assert_select "input#phase_site_id[name=?]", "phase[site_id]"
      assert_select "input#phase_stakeholder_id[name=?]", "phase[stakeholder_id]"
      assert_select "textarea#phase_description[name=?]", "phase[description]"
      assert_select "input#phase_proposal_number[name=?]", "phase[proposal_number]"
      assert_select "textarea#phase_notes[name=?]", "phase[notes]"
      assert_select "input#phase_insurance_policy_number[name=?]", "phase[insurance_policy_number]"
      assert_select "textarea#phase_insurance_notes[name=?]", "phase[insurance_notes]"
      assert_select "input#phase_bill_name[name=?]", "phase[bill_name]"
      assert_select "input#phase_bill_attention[name=?]", "phase[bill_attention]"
      assert_select "input#phase_bill_address[name=?]", "phase[bill_address]"
      assert_select "input#phase_bill_city[name=?]", "phase[bill_city]"
      assert_select "input#phase_bill_state[name=?]", "phase[bill_state]"
      assert_select "input#phase_bill_zip[name=?]", "phase[bill_zip]"
      assert_select "textarea#phase_bad_pay_history[name=?]", "phase[bad_pay_history]"
      assert_select "input#phase_keywords[name=?]", "phase[keywords]"
    end
  end
end
