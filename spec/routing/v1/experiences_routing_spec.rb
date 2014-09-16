require "spec_helper"

describe V1::ExperiencesController do
  describe "routing" do

    it "routes to #index" do
      get("/v1/experiences").should route_to("v1/experiences#index")
    end

    it "routes to #new" do
      get("/v1/experiences/new").should route_to("v1/experiences#new")
    end

    it "routes to #show" do
      get("/v1/experiences/1").should route_to("v1/experiences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/v1/experiences/1/edit").should route_to("v1/experiences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/v1/experiences").should route_to("v1/experiences#create")
    end

    it "routes to #update" do
      put("/v1/experiences/1").should route_to("v1/experiences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/v1/experiences/1").should route_to("v1/experiences#destroy", :id => "1")
    end

  end
end
