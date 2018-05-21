require 'grid'

describe Grid do

  subject(:grid) { described_class.new }

  it 'has a default height of 10' do
    expect(grid.height).to eq(10)
  end
  it 'has a default width of 10' do
    expect(grid.width).to eq(10)
  end
  it 'can be set with a custom height and width' do
    rover = described_class.new(100,100)
    expect(rover.height).to eq(100)
    expect(rover.width).to eq(100)
  end
end