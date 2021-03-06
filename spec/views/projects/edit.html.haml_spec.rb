require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :name_alternate => "MyString",
      :number => "MyString",
      :prefix => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_name_alternate[name=?]", "project[name_alternate]"
      assert_select "input#project_number[name=?]", "project[number]"
      assert_select "input#project_prefix_id[name=?]", "project[prefix_id]"
      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
