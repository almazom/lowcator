require "spec_helper"

describe FavoritsController do
  describe "routing" do

    it "routes to #index" do
      get("/favorits").should route_to("favorits#index")
    end

    it "routes to #new" do
      get("/favorits/new").should route_to("favorits#new")
    end

    it "routes to #show" do
      get("/favorits/1").should route_to("favorits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/favorits/1/edit").should route_to("favorits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/favorits").should route_to("favorits#create")
    end

    it "routes to #update" do
      put("/favorits/1").should route_to("favorits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/favorits/1").should route_to("favorits#destroy", :id => "1")
    end

  end
end
