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
    grid = described_class.new(100,100)
    expect(grid.height).to eq(100)
    expect(grid.width).to eq(100)
  end
  it 'can hold a set of obstacles' do
    grid = described_class.new(100,100, obstacles: [[0,3], [1,2]])
    expect(grid.obstacles).to eq([[0,3], [1,2]])
  end
end