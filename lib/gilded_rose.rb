require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros'
        if item.name == 'Aged Brie'
          update_brie(item)
        elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
          update_backstage(item)
        else
          update_item(item)
        end
      end
    end
  end

  def update_item(item)
    if item.quality > 0
      if item.sell_in > 0
        item.quality -= 1
      else
        item.quality -= 2
      end
    end
    item.sell_in -= 1
  end

  def update_brie(item)
  # Quality increases by 1  before sell_in date
  # Quality increases by 2  after sell_in date
  # Quality cant go over 50
    if item.quality < 50
      if item.sell_in > 0
        item.quality += 1
      else
        item.quality += 2
      end
    end
    item.sell_in -= 1
  end

  def update_backstage(item)
    # - "Backstage passes": increases in Quality the older it gets:
    # 	- Quality increases by 2 when there are 10 days or less
    # 	- Quality increases by 3 when there are 5 days or less
    # 	- Quality drops to 0 after the concert
  end
end
