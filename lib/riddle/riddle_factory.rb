require 'riddle/riddle'

class RiddleFactory
  NUMBER_OF_ANSWERS = 4
  def next
    @count = @count ? (@count+1) % @questions.length : 0
    question = "What is the capital of #{@questions[@count]}?"
    correct_answer = @answers[@count]
    answers = [correct_answer]
    while answers.length < NUMBER_OF_ANSWERS do
      answers << @answers.sample
      answers = answers.uniq
    end
    Riddle.new(question, answers, correct_answer)
  end

  private

  def initialize(csv_path)
    count = 0
    @questions = []
    @answers = []
    File.open(csv_path) do |f|
      while line = f.gets do
        @answers[count], @questions[count] = line.split(':')
        count += 1
      end
    end
  end
end
