def select(items, &block)

  result = []

  items.each do |item|
    if block.call(item)
      result << item
    end
  end

  result

end

# Benefit - anytime someone wants to filter an array they can use this code
# with a block that says how they want to filter the array
# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#select' do
  it 'returns an array of words shorter than the given length' do
    input = ['a', 'big', 'black', 'bear', 'is', 'running']

# Here's the items and block (following the select and before .to)
    expect(select(input) { |word| word.length < 3}).to eq(['a', 'is'])
    expect(select(input) { |word| word.length < 4}).to eq(['a', 'big', 'is'])
  end

  it 'returns an empty array when given an empty array, regardless of the provided block' do
    expect(select([]) { |word| word.length < 3}).to eq([])
  end
end
