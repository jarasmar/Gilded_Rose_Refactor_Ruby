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

    context 'common items' do

      it 'before sell_in date quality degrades by 1' do
        items = [Item.new('Item', 2, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
      end

      it 'after sell_in date quality degrades by 2' do
        items = [Item.new('Item', -1, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 3
      end

      it 'quality cant be below 0' do
        items = [Item.new('Item', 3, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
  end
end
