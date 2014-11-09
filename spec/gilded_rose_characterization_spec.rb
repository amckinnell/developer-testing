require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    characterization = characterize(subject, 2)

    expect(characterization).to eq(expected)
  end

end

private

def items
  item_attributes = [
    ['Mail Armour', 10, 20],
    ['Aged Brie', 4, 9],
    ['Backstage passes to a TAFKAL80ETC concert', 15, 17]
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
  'c869cb44cd36e1553d18178bbddf8ef838937cc11551d958277a43b1adc8e8e5'
end
