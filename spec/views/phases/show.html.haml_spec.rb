require 'spec_helper'

describe "phases/show" do
  before(:each) do
    @phase = assign(:phase, stub_model(Phase,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phase/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Investigation Type/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/MyText/)
    rendered.should match(/Proposal Number/)
    rendered.should match(/MyText/)
    rendered.should match(/Insurance Policy Number/)
    rendered.should match(/MyText/)
    rendered.should match(/Bill Name/)
    rendered.should match(/Bill Attention/)
    rendered.should match(/Bill Address/)
    rendered.should match(/Bill City/)
    rendered.should match(/Bill State/)
    rendered.should match(/Bill Zip/)
    rendered.should match(/MyText/)
    rendered.should match(/Keywords/)
  end
end
