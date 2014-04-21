require 'spec_helper'

describe "project_managers/show" do
  before(:each) do
    @project_manager = assign(:project_manager, stub_model(ProjectManager,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
