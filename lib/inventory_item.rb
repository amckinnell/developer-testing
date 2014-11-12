class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :sell_in

  def initialize(item)
    @item = item
  end

  def expired?
    @item.sell_in < 0
  end

  def rollover
    @item.sell_in -= 1
  end

  def decrease_quality(delta = 1)
    @item.quality -= delta if 0 < @item.quality
  end

  def increase_quality(delta = 1)
    @item.quality += delta if @item.quality < 50
  end

  def writeoff
    @item.quality = 0
  end

end
