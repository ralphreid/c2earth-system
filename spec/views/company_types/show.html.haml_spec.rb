require 'spec_helper'

describe "company_types/show" do
  before(:each) do
    @company_type = assign(:company_type, stub_model(CompanyType,
      :name => "Company Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Type/)
  end
end
