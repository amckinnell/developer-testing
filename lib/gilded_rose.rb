class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| update_item_quality(InventoryItem.create(item)) }
  end

  private

  def update_item_quality(item)
    perform_inventory_rollover(item)
    perform_inventory_expiration(item)
  end

  def perform_inventory_rollover(item)
    case item.name
    when 'Aged Brie'
      item.rollover
      item.increase_quality
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.rollover
      amount = case item.sell_in
      when (0..4) then 3
      when (5..9) then 2
      else 1
      end
      item.increase_quality amount
    when 'Conjured Mana'
      item.rollover
      item.decrease_quality 2
    when 'Sulfuras, Hand of Ragnaros'
      # Do nothing
    else
      item.rollover
      item.decrease_quality
    end
  end

  def perform_inventory_expiration(item)
    case item.name
    when 'Aged Brie'
      item.increase_quality if item.expired?
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.writeoff if item.expired?
    when 'Conjured Mana'
      item.decrease_quality 2 if item.expired?
    when 'Sulfuras, Hand of Ragnaros'
      # Do nothing
    else
      item.decrease_quality if item.expired?
    end
  end

end
