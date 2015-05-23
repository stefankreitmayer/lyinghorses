class WelcomeController < ApplicationController
  def index
  end

  def find_room
    if room = Room.find_by_name(params[:room_name])
      redirect_to room
    else
      redirect_to '/',
        notice: 'This room does not exist. Did you spell the name correctly?'
    end
  end
end
