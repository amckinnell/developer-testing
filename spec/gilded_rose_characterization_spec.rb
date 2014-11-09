require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    characterization = characterize(subject, 20)

    expect(characterization).to eq(expected)
  end

end

private

def items
  item_attributes = [
    ['Mail Armour', 10, 20],
    ['Mail Armour', 10, 1],
    ['Aged Brie', 4, 9],
    ['Aged Brie', 1, 49],
    ['Backstage passes to a TAFKAL80ETC concert', 15, 17],
    ['Backstage passes to a TAFKAL80ETC concert', 5, 49],
    ['Sulfuras, Hand of Ragnaros', -1, 80]
  ]

  item_attributes.map { |args| Item.new(*args) }
end

def characterize(subject, days)
  characterization = []

  (1..days).each do
    subject.update_quality

    characterization.concat(subject.items.map(&:to_s))
  end

  Digest::SHA2.hexdigest(characterization.join)
end

def expected()
  '1768fa473f323772588a8978f6e6e198d2cefee256ba13eab4018717ea78ea0c'
end
