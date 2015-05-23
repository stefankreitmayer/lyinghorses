require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  let(:valid_attributes) {
    {name: 'ExampleRoom'}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rooms as @rooms" do
      room = Room.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:rooms)).to eq([room])
    end
  end

  describe "GET #show" do
    it "assigns the requested room as @room" do
      room = Room.create! valid_attributes
      get :show, {:id => room.to_param}, valid_session
      expect(assigns(:room)).to eq(room)
    end
    it "assigns the current riddle as @riddle" do
      room = Room.create! valid_attributes
      get :show, {:id => room.to_param}, valid_session
      expect(assigns(:riddle)).to be_a(Riddle)
    end
  end

  describe "GET #new" do
    it "assigns a new room as @room" do
      get :new, {}, valid_session
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, {:room => valid_attributes}, valid_session
        }.to change(Room, :count).by(1)
      end

      it "assigns a newly created room as @room" do
        post :create, {:room => valid_attributes}, valid_session
        expect(assigns(:room)).to be_a(Room)
        expect(assigns(:room)).to be_persisted
      end

      it "redirects to the created room" do
        post :create, {:room => valid_attributes}, valid_session
        expect(response).to redirect_to(Room.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        post :create, {:room => invalid_attributes}, valid_session
        expect(assigns(:room)).to be_a_new(Room)
      end

      it "re-renders the 'new' template" do
        post :create, {:room => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested room" do
      room = Room.create! valid_attributes
      expect {
        delete :destroy, {:id => room.to_param}, valid_session
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      room = Room.create! valid_attributes
      delete :destroy, {:id => room.to_param}, valid_session
      expect(response).to redirect_to(rooms_url)
    end
  end

end
