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

  def selection_correct?
    @selection == current_riddle.correct_answer
  end

  def select(answer)
    @selection = answer
  end

  private

  def initialize(room_name)
    @room_name = room_name
  end
end
