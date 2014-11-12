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
    item.rollover

    case item.name
    when 'Aged Brie'
      item.increase_quality
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.increase_quality
      item.increase_quality if item.sell_in < 10
      item.increase_quality if item.sell_in < 5
    when 'Conjured Mana'
      item.decrease_quality 2
    else
      item.decrease_quality
    end
  end

  def perform_inventory_expiration(item)
    return unless item.expired?

    case item.name
    when 'Aged Brie'
      item.increase_quality
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.writeoff
    when 'Conjured Mana'
      item.decrease_quality 2
    else
      item.decrease_quality
    end
  end

end
