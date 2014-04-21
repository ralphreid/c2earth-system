require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "Name",
      :name_alternate => "Name Alternate",
      :number => "Number",
      :prefix_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Name Alternate/)
    rendered.should match(/Number/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
