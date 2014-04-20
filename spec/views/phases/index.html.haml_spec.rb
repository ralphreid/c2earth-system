require 'spec_helper'

describe "phases/index" do
  before(:each) do
    assign(:phases, [
      stub_model(Phase,
        :phase => "Phase",
        :project_id => 1,
        :company_id => 2,
        :project_manager_id => 3,
        :investigation_type_id => "Investigation Type",
        :site_id => 4,
        :stakeholder_id => 5,
        :description => "MyText",
        :proposal_number => "Proposal Number",
        :notes => "MyText",
        :insurance_policy_number => "Insurance Policy Number",
        :insurance_notes => "MyText",
        :bill_name => "Bill Name",
        :bill_attention => "Bill Attention",
        :bill_address => "Bill Address",
        :bill_city => "Bill City",
        :bill_state => "Bill State",
        :bill_zip => "Bill Zip",
        :bad_pay_history => "MyText",
        :keywords => "Keywords"
      ),
      stub_model(Phase,
        :phase => "Phase",
        :project_id => 1,
        :company_id => 2,
        :project_manager_id => 3,
        :investigation_type_id => "Investigation Type",
        :site_id => 4,
        :stakeholder_id => 5,
        :description => "MyText",
        :proposal_number => "Proposal Number",
        :notes => "MyText",
        :insurance_policy_number => "Insurance Policy Number",
        :insurance_notes => "MyText",
        :bill_name => "Bill Name",
        :bill_attention => "Bill Attention",
        :bill_address => "Bill Address",
        :bill_city => "Bill City",
        :bill_state => "Bill State",
        :bill_zip => "Bill Zip",
        :bad_pay_history => "MyText",
        :keywords => "Keywords"
      )
    ])
  end

  it "renders a list of phases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phase".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Investigation Type".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Proposal Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Insurance Policy Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Name".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Attention".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address".to_s, :count => 2
    assert_select "tr>td", :text => "Bill City".to_s, :count => 2
    assert_select "tr>td", :text => "Bill State".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Zip".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
  end
end
