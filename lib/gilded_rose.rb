require_relative 'item'

class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # Sulfuras remains always the same
      return if item_is_sulfuras?(item)

      return update_brie(item) if item_is_aged_brie?(item)

      return update_backstage(item) if item_is_backstage?(item)

      return update_conjured(item) if item_is_conjured?(item)

      update_item(item)
      # Sell_in date decreases 1 every day
      reduce_sell_in(item)
    end
  end

  private

  # checks for items name

  def item_is_sulfuras?(item)
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def item_is_aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def item_is_backstage?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def item_is_conjured?(item)
    item.name == 'Conjured'
  end

  # checks for items quality

  def quality_is_minimum?(item)
    item.quality == MIN_QUALITY
  end

  def quality_is_maximum?(item)
    item.quality == MAX_QUALITY
  end

  # checks for items sell_in

  def sell_in_positive?(item)
    item.sell_in > 0
  end

  def more_than_10_days_left?(item)
    item.sell_in > 10
  end

  def six_to_10_days_left?(item)
    item.sell_in > 6
  end

  # items date update

  def reduce_sell_in(item)
    item.sell_in -= 1
  end

  # items quality updates

  def update_item(item)
    # Quality cant go below minimum (0)
    # Quality decreases by 1 before sell_in date
    # Quality decreases by 2 after sell_in date
    return if quality_is_minimum?(item)

    if sell_in_positive?(item)
      item.quality -= 1
    else
      item.quality -= 2
    end
  end

  def update_brie(item)
    # Quality cant go over maximum (50)
    # Quality increases by 1  before sell_in date
    # Quality increases by 2  after sell_in date
    return if quality_is_maximum?(item)

    if sell_in_positive?(item)
      item.quality += 1
    else
      item.quality += 2
    end
  end

  def update_backstage(item)
    # Quality cant go over maximum (50)
    # Quality increases by 1 when there are 10 days or more
    # Quality increases by 2 when there are 10 days or less
    # Quality increases by 3 when there are 5 days or less
    # Quality drops to 0 after the concert
    return if quality_is_maximum?(item)

    if more_than_10_days_left?(item)
      item.quality += 1
    elsif six_to_10_days_left?(item)
      item.quality += 2
    elsif sell_in_positive?(item)
      item.quality += 3
    else
      item.quality -= item.quality
    end
  end

  def update_conjured(item)
    # Quality cant go below minimum (0)
    # Quality decreases by 2 before sell_in date
    # Quality decreases by 4 after sell_in date
    return if quality_is_minimum?(item)

    if sell_in_positive?(item)
      item.quality -= 2
    else
      item.quality -= 4
    end
  end
end
