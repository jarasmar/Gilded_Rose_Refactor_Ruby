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
      expect { GildedRose.new(items).update_quality() }.to(change { items[0].quality })
    end

    it 'updates the sell_in' do
      items = [Item.new("Item", 5, 5)]
      expect { GildedRose.new(items).update_quality() }.to(change { items[0].sell_in })
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

    context 'Aged Brie' do

      it 'before sell_in date quality increases by 1' do
        items = [Item.new('Aged Brie', 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 6
      end

      it 'after sell_in date quality increases by 2' do
        items = [Item.new('Aged Brie', -3, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 7
      end

      it 'quality cannot go over 50' do
        items = [Item.new('Aged Brie', -3, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context 'Sulfuras, Hand of Ragnaros' do

      it 'quality is always 80' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', -3, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do

      it 'quality increases by 1 when sell_in > 10' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 31
      end

      it 'quality increases by 2 when sell_in is 10 to 6' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 32
      end

      it 'quality increases by 3 when sell_in is 5 to 1' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 33
      end

      it 'quality drops to 0 after sell_in date' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
  end
end
