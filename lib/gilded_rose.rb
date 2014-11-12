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
    item.perform_inventory_rollover
    item.perform_inventory_expiration
  end

end
