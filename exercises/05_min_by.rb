def min_by(items, &block)

    result = nil

    items.each do |item|
      if result.nil?
        result = item
      else
        result = item if block.call(item) < block.call(result)
      end
    end

    result

end

# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#min_by' do
  it 'returns the shortest word in an array' do
    input = ['a', 'big', 'black', 'bear', 'is', 'running']

    expect(min_by(input) { |word| word.length }).to eq('a')
  end

  it 'returns the first shortest word if there are multiples' do
    input = ['fa', 'la']

    expect(min_by(input) { |word| word.length }).to eq('fa')
  end

  it 'returns the smallest values in an Array of numbers' do
    input = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

    expect(min_by(input) { |number| number }).to eq(2)
    expect(min_by(input.reverse) { |number| number }).to eq(2)
  end

  it 'returns nil when given an empty array, regardless of the block given' do
    expect(min_by([]) { |fooey| fooey.made_up_method }).to eq(nil)
  end
end
