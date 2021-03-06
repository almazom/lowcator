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

describe FavoritsController do

  # This should return the minimal set of attributes required to create a valid
  # Favorit. As you add validations to Favorit, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all favorits as @favorits" do
      favorit = Favorit.create! valid_attributes
      get :index
      assigns(:favorits).should eq([favorit])
    end
  end

  describe "GET show" do
    it "assigns the requested favorit as @favorit" do
      favorit = Favorit.create! valid_attributes
      get :show, :id => favorit.id.to_s
      assigns(:favorit).should eq(favorit)
    end
  end

  describe "GET new" do
    it "assigns a new favorit as @favorit" do
      get :new
      assigns(:favorit).should be_a_new(Favorit)
    end
  end

  describe "GET edit" do
    it "assigns the requested favorit as @favorit" do
      favorit = Favorit.create! valid_attributes
      get :edit, :id => favorit.id.to_s
      assigns(:favorit).should eq(favorit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Favorit" do
        expect {
          post :create, :favorit => valid_attributes
        }.to change(Favorit, :count).by(1)
      end

      it "assigns a newly created favorit as @favorit" do
        post :create, :favorit => valid_attributes
        assigns(:favorit).should be_a(Favorit)
        assigns(:favorit).should be_persisted
      end

      it "redirects to the created favorit" do
        post :create, :favorit => valid_attributes
        response.should redirect_to(Favorit.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved favorit as @favorit" do
        # Trigger the behavior that occurs when invalid params are submitted
        Favorit.any_instance.stub(:save).and_return(false)
        post :create, :favorit => {}
        assigns(:favorit).should be_a_new(Favorit)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Favorit.any_instance.stub(:save).and_return(false)
        post :create, :favorit => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested favorit" do
        favorit = Favorit.create! valid_attributes
        # Assuming there are no other favorits in the database, this
        # specifies that the Favorit created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Favorit.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => favorit.id, :favorit => {'these' => 'params'}
      end

      it "assigns the requested favorit as @favorit" do
        favorit = Favorit.create! valid_attributes
        put :update, :id => favorit.id, :favorit => valid_attributes
        assigns(:favorit).should eq(favorit)
      end

      it "redirects to the favorit" do
        favorit = Favorit.create! valid_attributes
        put :update, :id => favorit.id, :favorit => valid_attributes
        response.should redirect_to(favorit)
      end
    end

    describe "with invalid params" do
      it "assigns the favorit as @favorit" do
        favorit = Favorit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Favorit.any_instance.stub(:save).and_return(false)
        put :update, :id => favorit.id.to_s, :favorit => {}
        assigns(:favorit).should eq(favorit)
      end

      it "re-renders the 'edit' template" do
        favorit = Favorit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Favorit.any_instance.stub(:save).and_return(false)
        put :update, :id => favorit.id.to_s, :favorit => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested favorit" do
      favorit = Favorit.create! valid_attributes
      expect {
        delete :destroy, :id => favorit.id.to_s
      }.to change(Favorit, :count).by(-1)
    end

    it "redirects to the favorits list" do
      favorit = Favorit.create! valid_attributes
      delete :destroy, :id => favorit.id.to_s
      response.should redirect_to(favorits_url)
    end
  end

end
