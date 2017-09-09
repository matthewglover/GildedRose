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

    @usable_items = @items.zip(features).map do |(item, feature)|
      item.extend(Updateable, feature)
    end
  end

  def update_quality
    @usable_items.each(&:update)
  end

  private
  def features 
    [
      Standardable,
      AgedBrieable,
      Standardable,
      Sulfurusable,
      BackstagePassable,
      Standardable]
  end
end
