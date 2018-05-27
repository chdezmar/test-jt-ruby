require 'rover_controller'

describe RoverController do

  subject(:rover_controller) {described_class.new}

  describe 'at initialization' do
    it 'is aware of the rover' do
      expect(rover_controller.rover).to be_an_instance_of(Rover)
    end
    it 'is aware of the grid' do
      expect(rover_controller.grid).to be_an_instance_of(Grid)
    end
  end

  describe '#move' do
    context 'no obstacles' do
      it 'moves the rover to its desired position' do
        rover_controller.move([:R, :F, :F, :L, :F, :F, :B])
        expect(rover_controller.rover.position).to eq([2,1])
        rover_controller.move([:B,:B])
        expect(rover_controller.rover.position).to eq([2,9])
      end
      it 'moves the rover to its desired position if grid is round' do
        rover_controller.move([:R, :F, :F, :F, :F, :F, :F, :F, :F, :F, :F])
        expect(rover_controller.rover.position).to eq([0,0])
        rover_controller.move([:F])
        expect(rover_controller.rover.position).to eq([1,0])
      end
    end

    context 'with obstacles' do
      let(:rover_controller) { described_class.new(Rover.new, Grid.new(10, 10, obstacles: [[0,4], [0,5]]))}
      it 'moves the rover to the last position before the obstacle' do
        expect { rover_controller.move([:F, :F, :F, :F, :F]) }.to raise_error
        expect(rover_controller.rover.position).to eq([0,3])
      end
    end
  end
end