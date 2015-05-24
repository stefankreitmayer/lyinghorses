require 'riddle/riddle'

class RiddleMaster
  attr_reader :room_name

  def self.find_or_create(room_name)
    @instances = {} unless @instances
    @instances[room_name] ||= self.new(room_name)
  end

  def current_riddle
    Riddle.new
  end

  private

  def initialize(room_name)
    @room_name = room_name
  end
end
