require 'riddle/riddle'

class RiddleFactory
  def next
    Riddle.new('who', %w(he she it), 'it')
  end
end
