require 'riddle/riddle_factory'

RSpec.describe RiddleFactory do
  let(:factory){RiddleFactory.new('vendor/assets/quiz_data/capitals_africa.csv')}

  it 'provides different riddles' do
    riddle1 = factory.next
    riddle2 = factory.next
    expect(riddle2.question).not_to eq riddle1.question
  end

  it 'provides riddles with a fixed number of answers' do
    expect(factory.next.answers.length).to eq RiddleFactory::NUMBER_OF_ANSWERS
  end
end
