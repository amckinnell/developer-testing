require 'rspec'
require 'approvals/rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(item_attributes)

    verify { characterize(subject, 20) }
  end

end

private

def item_attributes
  item_attributes = [
    ['Mail Armour', 10, 20],
    ['Mail Armour', 10, 1],
    ["+5 Dexterity Vest", 10, 20],
    ["Elixir of the Mongoose", 5, 7],
    ['Aged Brie', 4, 9],
    ['Aged Brie', 1, 49],
    ['Backstage passes to a TAFKAL80ETC concert', 15, 17],
    ['Backstage passes to a TAFKAL80ETC concert', 5, 49],
    ['Sulfuras, Hand of Ragnaros', -1, 80]
  ]
end

def characterize(subject, days)
  characterization = []

  (1..days).each_with_index do |day|
    subject.update_quality

    characterization << "Day #{day} of #{days}"
    subject.items.each { |item| characterization << "  #{item.to_s}" }
  end

  characterization.join("\n")
end
