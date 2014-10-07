class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| increase_item_quality(item) }
  end

  def increase_item_quality(item)
    return if item.name == 'Sulfuras, Hand of Ragnaros'

    if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
      if item.quality > 0
        item.quality = item.quality - 1
      end
    else
      if item.quality < 50
        item.quality = item.quality + 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
    end

    item.sell_in = item.sell_in - 1

    if item.sell_in < 0
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          if item.quality > 0
            item.quality = item.quality - 1
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
  end
end
