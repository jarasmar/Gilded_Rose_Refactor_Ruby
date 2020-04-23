require 'item'

describe Item do

  it 'generates a string with item information' do
    item = Item.new('strawberries', 5, 2)
    expect(item.to_s).to eq 'strawberries, 5, 2'
  end
end
