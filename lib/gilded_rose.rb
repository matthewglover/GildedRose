require "item"
require "updateable"
require "standardable"
require "sulfurusable"
require "backstage_passable"

class GildedRose

  attr_reader :items

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)

    @useable_items = make_useable_items!
  end

  def update_quality
    @useable_items.each(&:update)
  end

  private
  def make_useable_items!
    items_with_modules.map { |(item, feature)| item.extend(feature, Updateable) }
  end

  def items_with_modules
    @items.zip([
      Standardable,
      AgedBrieable,
      Standardable,
      Sulfurusable,
      BackstagePassable,
      Standardable])
  end
end
