class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :quality, :sell_in

  def self.create(item)
    case item.name
    when 'Aged Brie'
      AgedBrie.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePass.new(item)
    when 'Conjured Mana'
      ConjuredItem.new(item)
    when 'Sulfuras, Hand of Ragnaros'
      LegendaryItem.new(item)
    else
      StandardItem.new(item)
      end
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
    do_perform_inventory_rollover
  end

  def perform_inventory_expiration
    do_perform_inventory_expiration
  end

  class AgedBrie < InventoryItem;

    def do_perform_inventory_rollover
      rollover
      increase_quality
    end

    def do_perform_inventory_expiration
      increase_quality if expired?
    end

  end

  class BackstagePass < InventoryItem;

    def do_perform_inventory_rollover
      rollover
      increase_quality amount
    end

    def do_perform_inventory_expiration
      writeoff if expired?
    end

    private

    def amount
      case @item.sell_in
      when (0..4) then 3
      when (5..9) then 2
      else 1
      end
    end

  end

  class ConjuredItem < InventoryItem;

    def do_perform_inventory_rollover
      rollover
      decrease_quality 2
    end

    def do_perform_inventory_expiration
      decrease_quality 2 if expired?
    end

  end

  class LegendaryItem < InventoryItem;

    def do_perform_inventory_rollover
      # Do nothing
    end

    def do_perform_inventory_expiration
      # Do nothing
    end

  end

  class StandardItem < InventoryItem;

    def do_perform_inventory_rollover
      rollover
      decrease_quality
    end

    def do_perform_inventory_expiration
      decrease_quality if expired?
    end

  end

end
