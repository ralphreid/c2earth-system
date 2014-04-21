require "spec_helper"

describe FaultsController do
  describe "routing" do

    it "routes to #index" do
      get("/faults").should route_to("faults#index")
    end

    it "routes to #new" do
      get("/faults/new").should route_to("faults#new")
    end

    it "routes to #show" do
      get("/faults/1").should route_to("faults#show", :id => "1")
    end

    it "routes to #edit" do
      get("/faults/1/edit").should route_to("faults#edit", :id => "1")
    end

    it "routes to #create" do
      post("/faults").should route_to("faults#create")
    end

    it "routes to #update" do
      put("/faults/1").should route_to("faults#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/faults/1").should route_to("faults#destroy", :id => "1")
    end

  end
end
