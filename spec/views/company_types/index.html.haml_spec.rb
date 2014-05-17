require 'spec_helper'

describe "company_types/index" do
  before(:each) do
    assign(:company_types, [
      stub_model(CompanyType,
        :name => "Company Type"
      ),
      stub_model(CompanyType,
        :name => "Company Type"
      )
    ])
  end

  it "renders a list of company_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Type".to_s, :count => 2
  end
end
