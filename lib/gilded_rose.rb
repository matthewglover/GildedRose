require "standard_item"
require "aged_brie"
require "sulfurus"
require "backstage_pass"
require "conjured_item"

class GildedRose

  attr_reader :items

  def initialize
    @items = []
    @items << StandardItem.new("+5 Dexterity Vest", 10, 20)
    @items << AgedBrie.new("Aged Brie", 2, 0)
    @items << StandardItem.new("Elixir of the Mongoose", 5, 7)
    @items << Sulfurus.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << ConjuredItem.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each(&:update)
  end
end
