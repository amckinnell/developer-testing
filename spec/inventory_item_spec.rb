require 'rspec'

require_relative '../lib/inventory_item'
require_relative '../lib/item'

describe InventoryItem do

  context 'increase quality' do
    subject { InventoryItem.new(Item.new('+5 Dexterity Vest', 10, 20)) }

    it 'supports a delta of 1' do
      subject.increase_quality 1
      expect(subject.quality).to eq(21)
    end

    it 'supports a delta of 2' do
      subject.increase_quality 2
      expect(subject.quality).to eq(22)
    end

    it 'guards against delta that pushes quality beyond 50' do
      subject.increase_quality 31
      expect(subject.quality).to eq(50)
    end
  end

  context 'decrease quality' do
    subject { InventoryItem.new(Item.new('+5 Dexterity Vest', 10, 20)) }

    it 'supports delta is 1' do
      subject.decrease_quality 1
      expect(subject.quality).to eq(19)
    end

    it 'supports a delta of 2' do
      subject.decrease_quality 2
      expect(subject.quality).to eq(18)
    end

    it 'guards against delta that pushes quality below 0' do
      subject.decrease_quality 21
      expect(subject.quality).to eq(0)
    end
  end

  context 'writeoff' do
    subject { InventoryItem.new(Item.new('+5 Dexterity Vest', 10, 20)) }

    it 'zeroes the quality on a writeoff' do
      subject.writeoff
      expect(subject.quality).to eq(0)
    end
  end

end
