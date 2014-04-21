require 'spec_helper'

describe "project_managers/edit" do
  before(:each) do
    @project_manager = assign(:project_manager, stub_model(ProjectManager,
      :name => "MyString"
    ))
  end

  it "renders the edit project_manager form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_manager_path(@project_manager), "post" do
      assert_select "input#project_manager_name[name=?]", "project_manager[name]"
    end
  end
end
