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

  context '#move_forward' do
    it 'moves forward when orientation is N' do
      rover.deploy([2,2], :N)
      rover.move_forward
      expect(rover.position).to eq([2,3])
    end
    it 'moves forward when orientation is E' do
      rover.deploy([2,2], :E)
      rover.move_forward
      expect(rover.position).to eq([3,2])
    end
    it 'moves forward when orientation is S' do
      rover.deploy([2,2], :S)
      rover.move_forward
      expect(rover.position).to eq([2,1])
    end
    it 'moves forward when orientation is W' do
      rover.deploy([2,2], :W)
      rover.move_forward
      expect(rover.position).to eq([1,2])
    end
  end

  context '#move_backwards' do
    it 'moves backwards when orientation is N' do
      rover.deploy([2,2], :N)
      rover.move_backwards
      expect(rover.position).to eq([2,1])
    end
    it 'moves backwards when orientation is E' do
      rover.deploy([2,2], :E)
      rover.move_backwards
      expect(rover.position).to eq([1,2])
    end
    it 'moves backwards when orientation is S' do
      rover.deploy([2,2], :S)
      rover.move_backwards
      expect(rover.position).to eq([2,3])
    end
    it 'moves backwards when orientation is W' do
      rover.deploy([2,2], :W)
      rover.move_backwards
      expect(rover.position).to eq([3,2])
    end
  end
end