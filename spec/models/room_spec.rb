require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'requires a name' do
    expect(Room.new).to be_invalid
  end
  it 'does not allow multiple records to have the same name' do
    Room.create!(name: 'foo')
    expect(Room.new(name: 'foo')).to be_invalid
  end
end
