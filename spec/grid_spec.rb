require 'grid'

describe Grid do

  subject(:grid) { described_class.new }

  it 'has a default x of 10' do
    expect(grid.x).to eq(10)
  end
  it 'has a default y of 10' do
    expect(grid.y).to eq(10)
  end
  it 'can be set with a custom x and y' do
    grid = described_class.new(100,100)
    expect(grid.x).to eq(100)
    expect(grid.y).to eq(100)
  end
  it 'can hold a set of obstacles' do
    grid = described_class.new(100,100, obstacles: [[0,3], [1,2]])
    expect(grid.obstacles).to eq([[0,3], [1,2]])
  end
end