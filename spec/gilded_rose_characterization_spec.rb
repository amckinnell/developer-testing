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

    subject.items.each { |item| characterization << item.to_s }
  end

  characterization
end

def expected
  [
    'Mail Armour, 9, 19',
    'Aged Brie, 3, 10',
    'Backstage passes to a TAFKAL80ETC concert, 14, 18',
    'Mail Armour, 8, 18',
    'Aged Brie, 2, 11',
    'Backstage passes to a TAFKAL80ETC concert, 13, 19',
  ]
end
