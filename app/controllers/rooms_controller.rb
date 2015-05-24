require 'riddle/riddle_master'

class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :select_answer, :destroy]
  before_action :set_riddle, only: [:show, :select_answer]

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  def show
    @selected_answer = nil
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

  # POST /rooms/1
  def select_answer
    @selected_answer = params.require(:selected)
    respond_to :js
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

  def set_riddle
    @riddle = riddle_master.current_riddle
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def riddle_master
    RiddleMaster.find_or_create(@room.name)
  end
end
