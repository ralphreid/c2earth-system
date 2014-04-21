require 'spec_helper'

describe "faults/edit" do
  before(:each) do
    @fault = assign(:fault, stub_model(Fault,
      :name => "MyString"
    ))
  end

  it "renders the edit fault form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fault_path(@fault), "post" do
      assert_select "input#fault_name[name=?]", "fault[name]"
    end
  end
end
