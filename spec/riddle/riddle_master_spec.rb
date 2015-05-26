require 'riddle/riddle_master'

RSpec.describe RiddleMaster do
    let(:riddle_master){RiddleMaster.find_or_create(12345)}
  it 'can store and retrieve instances' do
    expect(RiddleMaster.find_or_create(12345)).to eq riddle_master
  end
  it 'provides a riddle' do
    expect(riddle_master.riddle).to be_a(Riddle)
  end
end
