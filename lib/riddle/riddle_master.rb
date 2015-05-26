require 'riddle/riddle'

class RiddleMaster
  attr_reader :room_name

  def self.find_or_create(room_name)
    @instances = {} unless @instances
    @instances[room_name] ||= self.new(room_name)
  end

  def self.destroy(room_name)
    @instances.delete(room_name)
  end

  def current_riddle
    Riddle.new
  end

  def selection_correct?(player)
    @selections[player] == current_riddle.correct_answer
  end

  def select(answer, player)
    @selections[player] = answer
    close
  end

  def expired?
    @closing_time && Time.now > @closing_time + 1.5
  end

  private

  def initialize(room_name)
    @room_name = room_name
    @selections = {}
  end

  def close
    @closing_time = Time.now
    reward_winners
  end

  def reward_winners
    @selections.keys.each do |player|
      player.increment_score if selection_correct?(player)
    end
  end
end
