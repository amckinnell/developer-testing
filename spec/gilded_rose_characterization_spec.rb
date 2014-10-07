require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    items = [
      Item.new('Mail Armour', 10, 20),
      Item.new('Aged Brie', 4, 9)
    ]
    subject = GildedRose.new(items)

    subject.update_quality
    expect(subject.items[0].to_s).to eq('Mail Armour, 9, 19')
    expect(subject.items[1].to_s).to eq(nil)


    subject.update_quality
    expect(subject.items[0].to_s).to eq('Mail Armour, 8, 18')
    expect(subject.items[1].to_s).to eq(nil)
  end

end
