require 'spec_helper'

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

describe ClientTypesController do

  # This should return the minimal set of attributes required to create a valid
  # ClientType. As you add validations to ClientType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "client_type" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClientTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all client_types as @client_types" do
      client_type = ClientType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:client_types).should eq([client_type])
    end
  end

  describe "GET show" do
    it "assigns the requested client_type as @client_type" do
      client_type = ClientType.create! valid_attributes
      get :show, {:id => client_type.to_param}, valid_session
      assigns(:client_type).should eq(client_type)
    end
  end

  describe "GET new" do
    it "assigns a new client_type as @client_type" do
      get :new, {}, valid_session
      assigns(:client_type).should be_a_new(ClientType)
    end
  end

  describe "GET edit" do
    it "assigns the requested client_type as @client_type" do
      client_type = ClientType.create! valid_attributes
      get :edit, {:id => client_type.to_param}, valid_session
      assigns(:client_type).should eq(client_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClientType" do
        expect {
          post :create, {:client_type => valid_attributes}, valid_session
        }.to change(ClientType, :count).by(1)
      end

      it "assigns a newly created client_type as @client_type" do
        post :create, {:client_type => valid_attributes}, valid_session
        assigns(:client_type).should be_a(ClientType)
        assigns(:client_type).should be_persisted
      end

      it "redirects to the created client_type" do
        post :create, {:client_type => valid_attributes}, valid_session
        response.should redirect_to(ClientType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved client_type as @client_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClientType.any_instance.stub(:save).and_return(false)
        post :create, {:client_type => { "client_type" => "invalid value" }}, valid_session
        assigns(:client_type).should be_a_new(ClientType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClientType.any_instance.stub(:save).and_return(false)
        post :create, {:client_type => { "client_type" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested client_type" do
        client_type = ClientType.create! valid_attributes
        # Assuming there are no other client_types in the database, this
        # specifies that the ClientType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ClientType.any_instance.should_receive(:update).with({ "client_type" => "MyString" })
        put :update, {:id => client_type.to_param, :client_type => { "client_type" => "MyString" }}, valid_session
      end

      it "assigns the requested client_type as @client_type" do
        client_type = ClientType.create! valid_attributes
        put :update, {:id => client_type.to_param, :client_type => valid_attributes}, valid_session
        assigns(:client_type).should eq(client_type)
      end

      it "redirects to the client_type" do
        client_type = ClientType.create! valid_attributes
        put :update, {:id => client_type.to_param, :client_type => valid_attributes}, valid_session
        response.should redirect_to(client_type)
      end
    end

    describe "with invalid params" do
      it "assigns the client_type as @client_type" do
        client_type = ClientType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClientType.any_instance.stub(:save).and_return(false)
        put :update, {:id => client_type.to_param, :client_type => { "client_type" => "invalid value" }}, valid_session
        assigns(:client_type).should eq(client_type)
      end

      it "re-renders the 'edit' template" do
        client_type = ClientType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClientType.any_instance.stub(:save).and_return(false)
        put :update, {:id => client_type.to_param, :client_type => { "client_type" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested client_type" do
      client_type = ClientType.create! valid_attributes
      expect {
        delete :destroy, {:id => client_type.to_param}, valid_session
      }.to change(ClientType, :count).by(-1)
    end

    it "redirects to the client_types list" do
      client_type = ClientType.create! valid_attributes
      delete :destroy, {:id => client_type.to_param}, valid_session
      response.should redirect_to(client_types_url)
    end
  end

end
