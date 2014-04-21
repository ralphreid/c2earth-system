require "spec_helper"

describe ProjectManagersController do
  describe "routing" do

    it "routes to #index" do
      get("/project_managers").should route_to("project_managers#index")
    end

    it "routes to #new" do
      get("/project_managers/new").should route_to("project_managers#new")
    end

    it "routes to #show" do
      get("/project_managers/1").should route_to("project_managers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_managers/1/edit").should route_to("project_managers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_managers").should route_to("project_managers#create")
    end

    it "routes to #update" do
      put("/project_managers/1").should route_to("project_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_managers/1").should route_to("project_managers#destroy", :id => "1")
    end

  end
end
