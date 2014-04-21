require "spec_helper"

describe InvestigationTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/investigation_types").should route_to("investigation_types#index")
    end

    it "routes to #new" do
      get("/investigation_types/new").should route_to("investigation_types#new")
    end

    it "routes to #show" do
      get("/investigation_types/1").should route_to("investigation_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/investigation_types/1/edit").should route_to("investigation_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/investigation_types").should route_to("investigation_types#create")
    end

    it "routes to #update" do
      put("/investigation_types/1").should route_to("investigation_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/investigation_types/1").should route_to("investigation_types#destroy", :id => "1")
    end

  end
end
