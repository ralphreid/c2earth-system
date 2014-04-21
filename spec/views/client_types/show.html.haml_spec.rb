require 'spec_helper'

describe "client_types/show" do
  before(:each) do
    @client_type = assign(:client_type, stub_model(ClientType,
      :client_type => "Client Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client Type/)
  end
end
