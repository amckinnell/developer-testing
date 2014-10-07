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

    if item.name == 'Aged Brie'
      increase_quality(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      increase_quality(item)
      increase_quality(item) if item.sell_in < 10
      increase_quality(item) if item.sell_in < 5
    else
      decrease_quality(item)
    end

    if expired?(item)
      if item.name == 'Aged Brie'
        increase_quality(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        writeoff(item)
      else
        decrease_quality(item)
      end
    end
  end

  def expired?(item)
    item.sell_in < 0
  end

  def decrease_quality(item)
    item.quality -= 1 if 0 < item.quality
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def writeoff(item)
    item.quality = 0
  end

end
