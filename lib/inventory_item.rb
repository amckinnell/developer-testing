class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :sell_in, :sell_in=

  def initialize(item)
    @item = item
  end

  def expired?
    @item.sell_in < 0
  end

  def decrease_quality
    @item.quality -= 1 if 0 < @item.quality
  end

  def increase_quality
    @item.quality += 1 if @item.quality < 50
  end

  def writeoff
    @item.quality = 0
  end

end
