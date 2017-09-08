require 'item.rb'

class GildedRose

  attr_reader :items

  @items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each do |item|
      decrease_item_sell_in!(item) unless sulfurus_item?(item)

      if standard_quality_item?(item)
        decrease_item_quality!(item) unless minimum_quality_item?(item)
      else
        unless maximum_quality_item?(item)
          increase_item_quality!(item)
          increase_backstage_item_quality!(item) if backstage_item?(item)
        end
      end

      if expired_item?(item)
        if aged_brie_item?(item)  
          increase_item_quality!(item) if maximum_quality_item?(item)
        else
          if backstage_item?(item)
            item.quality = 0
          else
            decrease_item_quality!(item) unless minimum_quality_item?(item) || sulfurus_item?(item)
          end
        end
      end
    end
  end

  def expired_item?(item)
    item.sell_in < 0
  end

  private
  def aged_brie_item?(item)
    item.name == "Aged Brie"
  end

  def standard_quality_item?(item)
    item.name != "Aged Brie" && 
    item.name != "Backstage passes to a TAFKAL80ETC concert" &&
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def minimum_quality_item?(item)
    item.quality == 0
  end

  def maximum_quality_item?(item)
    item.quality >= 50
  end

  def decrease_item_quality!(item)
    item.quality -= 1
  end

  def increase_item_quality!(item)
    item.quality += 1
  end

  def backstage_item?(item)
    item.name =~ /^Backstage.+/
  end

  def increase_backstage_item_quality!(item)
    # NOTE: This code is not being tested
    if item.sell_in < 11
      unless maximum_quality_item?(item)
        increase_item_quality!(item)
      end
    end
    if item.sell_in < 6
      unless maximum_quality_item?(item)
        increase_item_quality!(item)
      end
    end
  end

  def decrease_item_sell_in!(item)
    item.sell_in -= 1
  end

  def sulfurus_item?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end
end
