require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # Sulfuras remains always the same
      if item.name != 'Sulfuras, Hand of Ragnaros'
        if item.name == 'Aged Brie'
          update_brie(item)
        elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
          update_backstage(item)
        elsif item.name == 'Conjured'
          update_conjured(item)
        else
          update_item(item)
        end
        # Sell_in date decreases 1 every day
        item.sell_in -= 1
      end
    end
  end

  private

  def update_item(item)
    # Quality cant go below 0
    # Quality decreases by 1 before sell_in date
    # Quality decreases by 2 after sell_in date
    if item.quality > 0
      if item.sell_in > 0
        item.quality -= 1
      else
        item.quality -= 2
      end
    end
  end

  def update_brie(item)
    # Quality cant go over 50
    # Quality increases by 1  before sell_in date
    # Quality increases by 2  after sell_in date
    if item.quality < 50
      if item.sell_in > 0
        item.quality += 1
      else
        item.quality += 2
      end
    end
  end

  def update_backstage(item)
    # Quality cant go over 50
    # Quality increases by 1 when there are 10 days or more
    # Quality increases by 2 when there are 10 days or less
    # Quality increases by 3 when there are 5 days or less
    # Quality drops to 0 after the concert
    if item.quality < 50
      if item.sell_in > 10
        item.quality += 1
      elsif item.sell_in > 6
        item.quality += 2
      elsif item.sell_in > 0
        item.quality += 3
      else
        item.quality -= item.quality
      end
    end
  end

  def update_conjured(item)
    # Quality cant go below 0
    # Quality decreases by 2 before sell_in date
    # Quality decreases by 4 after sell_in date
    if item.quality > 0
      if item.sell_in > 0
        item.quality -= 2
      else
        item.quality -= 4
      end
    end
  end
end
