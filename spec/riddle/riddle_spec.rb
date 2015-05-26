require 'riddle/riddle'

RSpec.describe Riddle do
  it 'provides all the attributes' do
    question = 'who'
    answers = %w(he she it)
    correct_answer = 'it'
    riddle = Riddle.new(question, answers, correct_answer)
    expect(riddle.question).to eq question
    expect(riddle.answers).to eq answers
    expect(riddle.correct_answer).to eq correct_answer
  end
end

