class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :quality, :sell_in

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
    @item.quality = [@item.quality - delta, 0].max
  end

  def increase_quality(delta = 1)
    @item.quality = [@item.quality + delta, 50].min
  end

  def writeoff
    @item.quality = 0
  end

end
