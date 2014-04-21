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

describe FaultsController do

  # This should return the minimal set of attributes required to create a valid
  # Fault. As you add validations to Fault, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FaultsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all faults as @faults" do
      fault = Fault.create! valid_attributes
      get :index, {}, valid_session
      assigns(:faults).should eq([fault])
    end
  end

  describe "GET show" do
    it "assigns the requested fault as @fault" do
      fault = Fault.create! valid_attributes
      get :show, {:id => fault.to_param}, valid_session
      assigns(:fault).should eq(fault)
    end
  end

  describe "GET new" do
    it "assigns a new fault as @fault" do
      get :new, {}, valid_session
      assigns(:fault).should be_a_new(Fault)
    end
  end

  describe "GET edit" do
    it "assigns the requested fault as @fault" do
      fault = Fault.create! valid_attributes
      get :edit, {:id => fault.to_param}, valid_session
      assigns(:fault).should eq(fault)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fault" do
        expect {
          post :create, {:fault => valid_attributes}, valid_session
        }.to change(Fault, :count).by(1)
      end

      it "assigns a newly created fault as @fault" do
        post :create, {:fault => valid_attributes}, valid_session
        assigns(:fault).should be_a(Fault)
        assigns(:fault).should be_persisted
      end

      it "redirects to the created fault" do
        post :create, {:fault => valid_attributes}, valid_session
        response.should redirect_to(Fault.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fault as @fault" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fault.any_instance.stub(:save).and_return(false)
        post :create, {:fault => { "name" => "invalid value" }}, valid_session
        assigns(:fault).should be_a_new(Fault)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fault.any_instance.stub(:save).and_return(false)
        post :create, {:fault => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested fault" do
        fault = Fault.create! valid_attributes
        # Assuming there are no other faults in the database, this
        # specifies that the Fault created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Fault.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => fault.to_param, :fault => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested fault as @fault" do
        fault = Fault.create! valid_attributes
        put :update, {:id => fault.to_param, :fault => valid_attributes}, valid_session
        assigns(:fault).should eq(fault)
      end

      it "redirects to the fault" do
        fault = Fault.create! valid_attributes
        put :update, {:id => fault.to_param, :fault => valid_attributes}, valid_session
        response.should redirect_to(fault)
      end
    end

    describe "with invalid params" do
      it "assigns the fault as @fault" do
        fault = Fault.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fault.any_instance.stub(:save).and_return(false)
        put :update, {:id => fault.to_param, :fault => { "name" => "invalid value" }}, valid_session
        assigns(:fault).should eq(fault)
      end

      it "re-renders the 'edit' template" do
        fault = Fault.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fault.any_instance.stub(:save).and_return(false)
        put :update, {:id => fault.to_param, :fault => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fault" do
      fault = Fault.create! valid_attributes
      expect {
        delete :destroy, {:id => fault.to_param}, valid_session
      }.to change(Fault, :count).by(-1)
    end

    it "redirects to the faults list" do
      fault = Fault.create! valid_attributes
      delete :destroy, {:id => fault.to_param}, valid_session
      response.should redirect_to(faults_url)
    end
  end

end
