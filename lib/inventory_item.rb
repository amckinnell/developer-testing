class InventoryItem
  extend Forwardable

  def_delegators :@item, :name, :quality, :sell_in

  def self.create(item)
    InventoryItemFactory.create(item)
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

  def decrease_quality(delta)
    @item.quality = [@item.quality - delta, 0].max
  end

  def increase_quality(delta)
    @item.quality = [@item.quality + delta, 50].min
  end

  def writeoff
    @item.quality = 0
  end

  def inventory_rollover
    do_inventory_rollover
  end

  def inventory_expiration
    do_inventory_expiration if expired?
  end

  class AgedBrie < InventoryItem;

    def do_inventory_rollover
      rollover
      increase_quality 1
    end

    def do_inventory_expiration
      increase_quality 1
    end

  end

  class BackstagePass < InventoryItem;

    def do_inventory_rollover
      rollover
      increase_quality amount
    end

    def do_inventory_expiration
      writeoff
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

    def do_inventory_rollover
      rollover
      decrease_quality 2
    end

    def do_inventory_expiration
      decrease_quality 2
    end

  end

  class LegendaryItem < InventoryItem;

    def do_inventory_rollover
      # Do nothing
    end

    def do_inventory_expiration
      # Do nothing
    end

  end

  class StandardItem < InventoryItem;

    def do_inventory_rollover
      rollover
      decrease_quality 1
    end

    def do_inventory_expiration
      decrease_quality 1
    end

  end

  class InventoryItemFactory

    INVENTORY_ITEMS = {
      'Aged Brie' => AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => BackstagePass,
      'Conjured Mana' => ConjuredItem,
      'Sulfuras, Hand of Ragnaros' => LegendaryItem
    }

    def self.create(item)
      item_class = INVENTORY_ITEMS.fetch(item.name, StandardItem)
      item_class.method(:new).call(item)
    end

  end

end
