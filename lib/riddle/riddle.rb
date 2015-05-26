class Riddle
  attr_reader :question, :answers, :correct_answer

  private

  def initialize(question, answers, correct_answer)
    @question = question
    @answers = answers
    @correct_answer = correct_answer
  end
end
