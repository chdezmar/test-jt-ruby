require 'rover'

describe Rover do

  subject(:rover) { described_class.new }

  context '#at initialization' do
    it 'has no position' do
      expect(rover.position).to be_an_instance_of(Array)
      expect(rover.position).to be_empty
    end
    it 'has no orientation' do
      expect(rover.orientation).to be_nil
    end
  end

  context '#deploy' do
    it 'can be deployed by passing a starting point and orientation' do
      rover.deploy([0,0], :N)
      expect(rover.position).to eq([0,0])
      expect(rover.orientation).to eq(:N)
    end
  end
end