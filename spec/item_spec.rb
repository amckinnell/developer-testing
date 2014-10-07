require 'rspec'

require_relative '../lib/item'

describe Item do

  it 'knows how to display' do
    subject = Item.new('+5 Dexterity Vest', 10, 20)

    expect(subject.to_s).to eq('+5 Dexterity Vest, 10, 20')
  end

end
