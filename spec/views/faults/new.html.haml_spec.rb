require 'spec_helper'

describe "faults/new" do
  before(:each) do
    assign(:fault, stub_model(Fault,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new fault form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faults_path, "post" do
      assert_select "input#fault_name[name=?]", "fault[name]"
    end
  end
end
