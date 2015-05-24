require 'riddle/riddle_master'

RSpec.describe RiddleMaster do
  it 'can store and retrieve instances' do
    riddle_master = RiddleMaster.new(12345)
    expect(RiddleMaster.find(12345)).to eq riddle_master
  end
  it 'provides a riddle' do
    expect(RiddleMaster.new(12345).current_riddle).to be_a(Riddle)
  end
end
