class Riddle
  def self.count
    @count ||= 0
  end
  def self.increment_count
    @count = count + 1
  end

  def question
    '1000 + ' + self.class.count.to_s
  end

  def answers
    %w(foo bar baz) << correct_answer
  end

  def correct_answer
    "#{1000 + self.class.count}"
  end

  private

  def initialize
    self.class.increment_count
  end
end
