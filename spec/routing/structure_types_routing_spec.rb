require "spec_helper"

describe StructureTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/structure_types").should route_to("structure_types#index")
    end

    it "routes to #new" do
      get("/structure_types/new").should route_to("structure_types#new")
    end

    it "routes to #show" do
      get("/structure_types/1").should route_to("structure_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/structure_types/1/edit").should route_to("structure_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/structure_types").should route_to("structure_types#create")
    end

    it "routes to #update" do
      put("/structure_types/1").should route_to("structure_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/structure_types/1").should route_to("structure_types#destroy", :id => "1")
    end

  end
end
