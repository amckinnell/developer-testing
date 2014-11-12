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
      amount = case item.sell_in
      when (0..4) then 3
      when (5..9) then 2
      else 1
      end
      item.increase_quality amount
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
