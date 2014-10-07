require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    characterization = []

    subject.update_quality
    characterization << subject.items[0].to_s
    characterization << subject.items[1].to_s

    subject.update_quality
    characterization << subject.items[0].to_s
    characterization << subject.items[1].to_s

    expected = [
      'Mail Armour, 9, 19',
      'Aged Brie, 3, 10',
      'Mail Armour, 8, 18',
      'Aged Brie, 2, 11'
    ]

    expect(characterization).to eq(expected)
  end

end

private

def items
  item_attributes = [
    ['Mail Armour', 10, 20],
    ['Aged Brie', 4, 9]
  ]

  item_attributes.map { |args| Item.new(*args) }
end
