require 'riddle/riddle'

class RiddleMaster
  attr_reader :room_name
  class << self
    attr_reader :riddle_factory
  end

  def self.find_or_create(room_name, riddle_factory)
    @riddle_factory = riddle_factory
    @instances = {} unless @instances
    @instances[room_name] ||= self.new(room_name)
  end

  def self.destroy(room_name)
    @instances.delete(room_name)
  end

  def riddle
    @riddle ||= self.class.riddle_factory.next
  end

  def selection_correct?(player)
    @selections[player] == riddle.correct_answer
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
