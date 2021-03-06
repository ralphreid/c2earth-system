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

describe ProjectManagersController do

  # This should return the minimal set of attributes required to create a valid
  # ProjectManager. As you add validations to ProjectManager, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectManagersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all project_managers as @project_managers" do
      project_manager = ProjectManager.create! valid_attributes
      get :index, {}, valid_session
      assigns(:project_managers).should eq([project_manager])
    end
  end

  describe "GET show" do
    it "assigns the requested project_manager as @project_manager" do
      project_manager = ProjectManager.create! valid_attributes
      get :show, {:id => project_manager.to_param}, valid_session
      assigns(:project_manager).should eq(project_manager)
    end
  end

  describe "GET new" do
    it "assigns a new project_manager as @project_manager" do
      get :new, {}, valid_session
      assigns(:project_manager).should be_a_new(ProjectManager)
    end
  end

  describe "GET edit" do
    it "assigns the requested project_manager as @project_manager" do
      project_manager = ProjectManager.create! valid_attributes
      get :edit, {:id => project_manager.to_param}, valid_session
      assigns(:project_manager).should eq(project_manager)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProjectManager" do
        expect {
          post :create, {:project_manager => valid_attributes}, valid_session
        }.to change(ProjectManager, :count).by(1)
      end

      it "assigns a newly created project_manager as @project_manager" do
        post :create, {:project_manager => valid_attributes}, valid_session
        assigns(:project_manager).should be_a(ProjectManager)
        assigns(:project_manager).should be_persisted
      end

      it "redirects to the created project_manager" do
        post :create, {:project_manager => valid_attributes}, valid_session
        response.should redirect_to(ProjectManager.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project_manager as @project_manager" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectManager.any_instance.stub(:save).and_return(false)
        post :create, {:project_manager => { "name" => "invalid value" }}, valid_session
        assigns(:project_manager).should be_a_new(ProjectManager)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectManager.any_instance.stub(:save).and_return(false)
        post :create, {:project_manager => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project_manager" do
        project_manager = ProjectManager.create! valid_attributes
        # Assuming there are no other project_managers in the database, this
        # specifies that the ProjectManager created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProjectManager.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => project_manager.to_param, :project_manager => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested project_manager as @project_manager" do
        project_manager = ProjectManager.create! valid_attributes
        put :update, {:id => project_manager.to_param, :project_manager => valid_attributes}, valid_session
        assigns(:project_manager).should eq(project_manager)
      end

      it "redirects to the project_manager" do
        project_manager = ProjectManager.create! valid_attributes
        put :update, {:id => project_manager.to_param, :project_manager => valid_attributes}, valid_session
        response.should redirect_to(project_manager)
      end
    end

    describe "with invalid params" do
      it "assigns the project_manager as @project_manager" do
        project_manager = ProjectManager.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectManager.any_instance.stub(:save).and_return(false)
        put :update, {:id => project_manager.to_param, :project_manager => { "name" => "invalid value" }}, valid_session
        assigns(:project_manager).should eq(project_manager)
      end

      it "re-renders the 'edit' template" do
        project_manager = ProjectManager.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectManager.any_instance.stub(:save).and_return(false)
        put :update, {:id => project_manager.to_param, :project_manager => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project_manager" do
      project_manager = ProjectManager.create! valid_attributes
      expect {
        delete :destroy, {:id => project_manager.to_param}, valid_session
      }.to change(ProjectManager, :count).by(-1)
    end

    it "redirects to the project_managers list" do
      project_manager = ProjectManager.create! valid_attributes
      delete :destroy, {:id => project_manager.to_param}, valid_session
      response.should redirect_to(project_managers_url)
    end
  end

end
