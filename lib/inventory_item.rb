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
      case name
      when 'Aged Brie'
        rollover
        increase_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        rollover
        amount = case @item.sell_in
        when (0..4) then
          3
        when (5..9) then
          2
        else
          1
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

    def do_perform_inventory_expiration
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

  class BackstagePass < InventoryItem;

    def do_perform_inventory_rollover
      case name
      when 'Aged Brie'
        rollover
        increase_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        rollover
        amount = case @item.sell_in
        when (0..4) then
          3
        when (5..9) then
          2
        else
          1
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

    def do_perform_inventory_expiration
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

  class ConjuredItem < InventoryItem;

    def do_perform_inventory_rollover
      case name
      when 'Aged Brie'
        rollover
        increase_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        rollover
        amount = case @item.sell_in
        when (0..4) then
          3
        when (5..9) then
          2
        else
          1
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

    def do_perform_inventory_expiration

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

  class LegendaryItem < InventoryItem;

    def do_perform_inventory_rollover
      case name
      when 'Aged Brie'
        rollover
        increase_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        rollover
        amount = case @item.sell_in
        when (0..4) then
          3
        when (5..9) then
          2
        else
          1
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

    def do_perform_inventory_expiration
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

  class StandardItem < InventoryItem;

    def do_perform_inventory_rollover
      case name
      when 'Aged Brie'
        rollover
        increase_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        rollover
        amount = case @item.sell_in
        when (0..4) then
          3
        when (5..9) then
          2
        else
          1
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

    def do_perform_inventory_expiration
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

end
