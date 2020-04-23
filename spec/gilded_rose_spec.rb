require 'gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('item', 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'item'
    end

    it 'updates the quality' do
      items = [Item.new("Item", 5, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change{ items[0].quality }
    end

    it 'updates the sell_in' do
      items = [Item.new("Item", 5, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change{ items[0].sell_in }
    end
  end
end
