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

describe ReceiptsController do

  # This should return the minimal set of attributes required to create a valid
  # Receipt. As you add validations to Receipt, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "category_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReceiptsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all receipts as @receipts" do
      receipt = Receipt.create! valid_attributes
      get :index, {}, valid_session
      assigns(:receipts).should eq([receipt])
    end
  end

  describe "GET show" do
    it "assigns the requested receipt as @receipt" do
      receipt = Receipt.create! valid_attributes
      get :show, {:id => receipt.to_param}, valid_session
      assigns(:receipt).should eq(receipt)
    end
  end

  describe "GET new" do
    it "assigns a new receipt as @receipt" do
      get :new, {}, valid_session
      assigns(:receipt).should be_a_new(Receipt)
    end
  end

  describe "GET edit" do
    it "assigns the requested receipt as @receipt" do
      receipt = Receipt.create! valid_attributes
      get :edit, {:id => receipt.to_param}, valid_session
      assigns(:receipt).should eq(receipt)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Receipt" do
        expect {
          post :create, {:receipt => valid_attributes}, valid_session
        }.to change(Receipt, :count).by(1)
      end

      it "assigns a newly created receipt as @receipt" do
        post :create, {:receipt => valid_attributes}, valid_session
        assigns(:receipt).should be_a(Receipt)
        assigns(:receipt).should be_persisted
      end

      it "redirects to the created receipt" do
        post :create, {:receipt => valid_attributes}, valid_session
        response.should redirect_to(Receipt.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved receipt as @receipt" do
        # Trigger the behavior that occurs when invalid params are submitted
        Receipt.any_instance.stub(:save).and_return(false)
        post :create, {:receipt => { "category_id" => "invalid value" }}, valid_session
        assigns(:receipt).should be_a_new(Receipt)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Receipt.any_instance.stub(:save).and_return(false)
        post :create, {:receipt => { "category_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested receipt" do
        receipt = Receipt.create! valid_attributes
        # Assuming there are no other receipts in the database, this
        # specifies that the Receipt created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Receipt.any_instance.should_receive(:update).with({ "category_id" => "1" })
        put :update, {:id => receipt.to_param, :receipt => { "category_id" => "1" }}, valid_session
      end

      it "assigns the requested receipt as @receipt" do
        receipt = Receipt.create! valid_attributes
        put :update, {:id => receipt.to_param, :receipt => valid_attributes}, valid_session
        assigns(:receipt).should eq(receipt)
      end

      it "redirects to the receipt" do
        receipt = Receipt.create! valid_attributes
        put :update, {:id => receipt.to_param, :receipt => valid_attributes}, valid_session
        response.should redirect_to(receipt)
      end
    end

    describe "with invalid params" do
      it "assigns the receipt as @receipt" do
        receipt = Receipt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Receipt.any_instance.stub(:save).and_return(false)
        put :update, {:id => receipt.to_param, :receipt => { "category_id" => "invalid value" }}, valid_session
        assigns(:receipt).should eq(receipt)
      end

      it "re-renders the 'edit' template" do
        receipt = Receipt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Receipt.any_instance.stub(:save).and_return(false)
        put :update, {:id => receipt.to_param, :receipt => { "category_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested receipt" do
      receipt = Receipt.create! valid_attributes
      expect {
        delete :destroy, {:id => receipt.to_param}, valid_session
      }.to change(Receipt, :count).by(-1)
    end

    it "redirects to the receipts list" do
      receipt = Receipt.create! valid_attributes
      delete :destroy, {:id => receipt.to_param}, valid_session
      response.should redirect_to(receipts_url)
    end
  end

end