class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| update_item_quality(InventoryItem.new(item)) }
  end

  private

  def update_item_quality(item)
    return if item.name == 'Sulfuras, Hand of Ragnaros'

    perform_inventory_rollover(item)
    perform_inventory_expiration(item)
  end

  def perform_inventory_rollover(item)
    item.sell_in -= 1

    case item.name
    when 'Aged Brie'
      increase_quality(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      increase_quality(item)
      increase_quality(item) if item.sell_in < 10
      increase_quality(item) if item.sell_in < 5
    when 'Conjured Mana'
      decrease_quality(item)
      decrease_quality(item)
    else
      decrease_quality(item)
    end
  end

  def perform_inventory_expiration(item)
    return unless expired?(item)

    case item.name
    when 'Aged Brie'
      increase_quality(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      writeoff(item)
    when 'Conjured Mana'
      decrease_quality(item)
      decrease_quality(item)
    else
      decrease_quality(item)
    end
  end

  def expired?(item)
    item.sell_in < 0
  end

  def decrease_quality(item)
    item.decrease_quality
  end

  def increase_quality(item)
    item.increase_quality
  end

  def writeoff(item)
    item.writeoff
  end

end
