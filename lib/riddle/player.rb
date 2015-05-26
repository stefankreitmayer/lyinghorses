class Player
  attr_reader :score

  def self.current
    @current ||= Player.new
  end

  def increment_score
    @score += 1
  end

  private

  def initialize
    @score = 0
    @current = self
  end
end
