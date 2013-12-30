require "spec_helper"

describe DsController do
  describe "routing" do

    it "routes to #index" do
      get("/ds").should route_to("ds#index")
    end

    it "routes to #new" do
      get("/ds/new").should route_to("ds#new")
    end

    it "routes to #show" do
      get("/ds/1").should route_to("ds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ds/1/edit").should route_to("ds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ds").should route_to("ds#create")
    end

    it "routes to #update" do
      put("/ds/1").should route_to("ds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ds/1").should route_to("ds#destroy", :id => "1")
    end

  end
end
