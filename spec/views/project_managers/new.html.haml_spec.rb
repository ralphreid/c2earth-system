require 'spec_helper'

describe "project_managers/new" do
  before(:each) do
    assign(:project_manager, stub_model(ProjectManager,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new project_manager form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_managers_path, "post" do
      assert_select "input#project_manager_name[name=?]", "project_manager[name]"
    end
  end
end
