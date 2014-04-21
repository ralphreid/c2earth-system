require 'spec_helper'

describe "faults/show" do
  before(:each) do
    @fault = assign(:fault, stub_model(Fault,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
