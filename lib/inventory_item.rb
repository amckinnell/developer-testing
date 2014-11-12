class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :quality, :sell_in

  def self.create(item)
    InventoryItem.new(item)
  end

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

  def perform_inventory_rollover
    case name
    when 'Aged Brie'
      rollover
      increase_quality
    when 'Backstage passes to a TAFKAL80ETC concert'
      rollover
      amount = case @item.sell_in
      when (0..4) then 3
      when (5..9) then 2
      else 1
      end
      increase_quality amount
    when 'Conjured Mana'
      rollover
      decrease_quality 2
    when 'Sulfuras, Hand of Ragnaros'
      # Do nothing
    else
      rollover
      decrease_quality
    end
  end

  def perform_inventory_expiration
    case name
    when 'Aged Brie'
      increase_quality if expired?
    when 'Backstage passes to a TAFKAL80ETC concert'
      writeoff if expired?
    when 'Conjured Mana'
      decrease_quality 2 if expired?
    when 'Sulfuras, Hand of Ragnaros'
      # Do nothing
    else
      decrease_quality if expired?
    end
  end

end
