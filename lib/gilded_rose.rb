class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| update_item_quality(item) }
  end

  private

  def update_item_quality(item)
    return if item.name == 'Sulfuras, Hand of Ragnaros'

    item.sell_in -= 1

    if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
      decrease_quality(item)
    else
      increase_quality(item)
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in < 10
          increase_quality(item)
        end
        if item.sell_in < 5
          increase_quality(item)
        end
      end
    end

    if item.sell_in < 0
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          decrease_quality(item)
        else
          item.quality = item.quality - item.quality
        end
      else
        increase_quality(item)
      end
    end
  end

  def decrease_quality(item)
    if item.quality > 0
      item.quality -= 1
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end
end
