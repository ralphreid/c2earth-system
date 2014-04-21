require "spec_helper"

describe StakeholderTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/stakeholder_types").should route_to("stakeholder_types#index")
    end

    it "routes to #new" do
      get("/stakeholder_types/new").should route_to("stakeholder_types#new")
    end

    it "routes to #show" do
      get("/stakeholder_types/1").should route_to("stakeholder_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stakeholder_types/1/edit").should route_to("stakeholder_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stakeholder_types").should route_to("stakeholder_types#create")
    end

    it "routes to #update" do
      put("/stakeholder_types/1").should route_to("stakeholder_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stakeholder_types/1").should route_to("stakeholder_types#destroy", :id => "1")
    end

  end
end
