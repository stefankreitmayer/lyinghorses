require 'riddle/riddle_master'
require 'riddle/riddle_factory'
require 'riddle/player'

class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :select_answer, :get_feedback, :destroy]
  before_action :set_riddle, only: [:show, :select_answer, :get_feedback]
  before_action :set_player, only: [:show, :select_answer, :get_feedback]

  DEFAULT_RIDDLE_FACTORY = RiddleFactory.new('vendor/assets/quiz_data/capitals_africa.csv')

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  def show
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

  # ajax POST
  def select_answer
    @selected_answer = params.require(:selected)
    riddle_master.select(@selected_answer, @player)
    respond_to :js
  end

  # ajax GET
  def get_feedback
    @is_correct = riddle_master.selection_correct?(@player)
    @expired = riddle_master.expired?
    if @expired
      RiddleMaster.destroy(@room.name)
    end
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
    @riddle = riddle_master.riddle
  end

  def set_player
    @player = Player.current
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def riddle_master
    RiddleMaster.find_or_create(@room.name, DEFAULT_RIDDLE_FACTORY)
  end
end
