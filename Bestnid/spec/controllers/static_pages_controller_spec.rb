require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET Sobre_bestnid" do
    it "returns http success" do
      get :Sobre_bestnid
      expect(response).to be_success
    end
  end

  describe "GET Ayuda" do
    it "returns http success" do
      get :Ayuda
      expect(response).to be_success
    end
  end

  describe "GET Contacto" do
    it "returns http success" do
      get :Contacto
      expect(response).to be_success
    end
  end

end
