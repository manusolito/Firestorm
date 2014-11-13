require "rails_helper"

RSpec.describe OfertaController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/oferta").to route_to("oferta#index")
    end

    it "routes to #new" do
      expect(:get => "/oferta/new").to route_to("oferta#new")
    end

    it "routes to #show" do
      expect(:get => "/oferta/1").to route_to("oferta#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/oferta/1/edit").to route_to("oferta#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/oferta").to route_to("oferta#create")
    end

    it "routes to #update" do
      expect(:put => "/oferta/1").to route_to("oferta#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/oferta/1").to route_to("oferta#destroy", :id => "1")
    end

  end
end
