def max_by(items, &block)
  max_item = nil
  items.each do |item|
    max_item ||= item
    max_item = item if block.call(max_item) < block.call(item)
    
  end
  max_item
end

# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#max_by' do
  it 'returns the longest word in an array' do
    input = ['a', 'big', 'black', 'bear', 'is', 'running']

    expect(max_by(input) { |word| word.length }).to eq('running')
  end

  it 'returns the first longest word if there are multiples' do
    input = ['fa', 'la']

    expect(max_by(input) { |word| word.length }).to eq('fa')
  end

  it 'returns the largest number in the list by comparing the numbers' do
    input = [1, 2, 256, 4, 512, 8]

    expect(max_by(input) { |num| num }).to eq(512)
  end

  it 'returns nil when given an empty array, regardless of the given block' do
    expect(max_by([]) { |foos| foos.foo_method }).to eq(nil)
  end
end
