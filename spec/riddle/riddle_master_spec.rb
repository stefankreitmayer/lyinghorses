require 'riddle/riddle_master'
require 'riddle/riddle_factory'

RSpec.describe RiddleMaster do
  let(:factory){RiddleFactory.new('vendor/assets/quiz_data/capitals_africa.csv')}
  let(:riddle_master){RiddleMaster.find_or_create(12345, factory)}
  it 'can store and retrieve instances' do
    expect(RiddleMaster.find_or_create(12345, factory)).to eq riddle_master
  end
  it 'provides a riddle' do
    expect(riddle_master.riddle).to be_a(Riddle)
  end
end
