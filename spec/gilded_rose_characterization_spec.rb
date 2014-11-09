require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    subject.update_quality
    expect(subject.items[0].to_s).to eq('Mail Armour, 9, 19')
    expect(subject.items[1].to_s).to eq('Aged Brie, 3, 10')


    subject.update_quality
    expect(subject.items[0].to_s).to eq('Mail Armour, 8, 18')
    expect(subject.items[1].to_s).to eq('Aged Brie, 2, 11')
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

