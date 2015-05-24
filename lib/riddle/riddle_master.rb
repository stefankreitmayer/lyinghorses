require 'riddle/riddle'

class RiddleMaster
  attr_reader :room_name

  def self.register_instance(instance)
    @instances = {} unless @instances
    @instances[instance.room_name] = instance
  end

  def self.find(room_name)
    raise KeyError.new('RiddleMaster has no instances') unless @instances
    return @instances.fetch(room_name)
  rescue KeyError
    raise KeyError.new('No RiddleMaster found for room name '+room_name)
  end

  def initialize(room_name)
    @room_name = room_name
    RiddleMaster.register_instance(self)
  end

  def current_riddle
    Riddle.new
  end
end
