require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

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

  describe "GET Sobre_Bestnid" do
    it "returns http success" do
      get :Sobre_Bestnid
      expect(response).to be_success
    end
  end

end
