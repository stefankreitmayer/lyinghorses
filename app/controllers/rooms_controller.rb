require 'riddle/riddle'

class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  def show
    @riddle = Riddle.new
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
