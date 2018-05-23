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
    before(:each) do
      @commands = [:R, :F, :F, :L, :F, :F, :B]
    end

    it 'receives and keeps an array of commands' do
      rover_controller.move(@commands)
      expect(rover_controller.commands).to be_an_instance_of(Array)
    end

    # it 'deploys the rover [0,0] position' do
    #   expect(rover_controller.rover.position).to eq([0,0])
    # end

    it 'moves the rover to its desired position' do
      rover_controller.move(@commands)
      expect(rover_controller.rover.position).to eq([2,1])
    end
    it 'moves the rover to its desired position if world is round' do
      rover_controller.move([:R, :F, :F, :F, :F, :F, :F, :F, :F, :F, :F, :F])
      puts rover_controller.rover.position
      expect(rover_controller.rover.position).to eq([1,0])
    end
  end
end