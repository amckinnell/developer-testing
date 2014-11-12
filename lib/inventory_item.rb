class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :quality, :quality=, :sell_in, :sell_in=

  def initialize(item)
    @item = item
  end

end
