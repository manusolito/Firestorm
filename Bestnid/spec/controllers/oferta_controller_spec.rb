require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OfertaController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Ofertum. As you add validations to Ofertum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OfertaController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all oferta as @oferta" do
      ofertum = Ofertum.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:oferta)).to eq([ofertum])
    end
  end

  describe "GET show" do
    it "assigns the requested ofertum as @ofertum" do
      ofertum = Ofertum.create! valid_attributes
      get :show, {:id => ofertum.to_param}, valid_session
      expect(assigns(:ofertum)).to eq(ofertum)
    end
  end

  describe "GET new" do
    it "assigns a new ofertum as @ofertum" do
      get :new, {}, valid_session
      expect(assigns(:ofertum)).to be_a_new(Ofertum)
    end
  end

  describe "GET edit" do
    it "assigns the requested ofertum as @ofertum" do
      ofertum = Ofertum.create! valid_attributes
      get :edit, {:id => ofertum.to_param}, valid_session
      expect(assigns(:ofertum)).to eq(ofertum)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ofertum" do
        expect {
          post :create, {:ofertum => valid_attributes}, valid_session
        }.to change(Ofertum, :count).by(1)
      end

      it "assigns a newly created ofertum as @ofertum" do
        post :create, {:ofertum => valid_attributes}, valid_session
        expect(assigns(:ofertum)).to be_a(Ofertum)
        expect(assigns(:ofertum)).to be_persisted
      end

      it "redirects to the created ofertum" do
        post :create, {:ofertum => valid_attributes}, valid_session
        expect(response).to redirect_to(Ofertum.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ofertum as @ofertum" do
        post :create, {:ofertum => invalid_attributes}, valid_session
        expect(assigns(:ofertum)).to be_a_new(Ofertum)
      end

      it "re-renders the 'new' template" do
        post :create, {:ofertum => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ofertum" do
        ofertum = Ofertum.create! valid_attributes
        put :update, {:id => ofertum.to_param, :ofertum => new_attributes}, valid_session
        ofertum.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested ofertum as @ofertum" do
        ofertum = Ofertum.create! valid_attributes
        put :update, {:id => ofertum.to_param, :ofertum => valid_attributes}, valid_session
        expect(assigns(:ofertum)).to eq(ofertum)
      end

      it "redirects to the ofertum" do
        ofertum = Ofertum.create! valid_attributes
        put :update, {:id => ofertum.to_param, :ofertum => valid_attributes}, valid_session
        expect(response).to redirect_to(ofertum)
      end
    end

    describe "with invalid params" do
      it "assigns the ofertum as @ofertum" do
        ofertum = Ofertum.create! valid_attributes
        put :update, {:id => ofertum.to_param, :ofertum => invalid_attributes}, valid_session
        expect(assigns(:ofertum)).to eq(ofertum)
      end

      it "re-renders the 'edit' template" do
        ofertum = Ofertum.create! valid_attributes
        put :update, {:id => ofertum.to_param, :ofertum => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ofertum" do
      ofertum = Ofertum.create! valid_attributes
      expect {
        delete :destroy, {:id => ofertum.to_param}, valid_session
      }.to change(Ofertum, :count).by(-1)
    end

    it "redirects to the oferta list" do
      ofertum = Ofertum.create! valid_attributes
      delete :destroy, {:id => ofertum.to_param}, valid_session
      expect(response).to redirect_to(oferta_url)
    end
  end

end
