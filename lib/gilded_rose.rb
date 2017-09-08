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
    @items.each do |crnt_item|
      if standard_quality_item?(crnt_item)
        crnt_item.quality -= 1 unless minimum_quality_item?(crnt_item)
      else
        if (crnt_item.quality < 50)
          crnt_item.quality = crnt_item.quality + 1
          if (crnt_item.name == "Backstage passes to a TAFKAL80ETC concert")
            if (crnt_item.sell_in < 11)
              if (crnt_item.quality < 50)
                crnt_item.quality = crnt_item.quality + 1
              end
            end
            if (crnt_item.sell_in < 6)
              if (crnt_item.quality < 50)
                crnt_item.quality = crnt_item.quality + 1
              end
            end
          end
        end
      end
      if (crnt_item.name != "Sulfuras, Hand of Ragnaros")
        crnt_item.sell_in = crnt_item.sell_in - 1;
      end
      if (crnt_item.sell_in < 0)
        if (crnt_item.name != "Aged Brie")
          if (crnt_item.name != "Backstage passes to a TAFKAL80ETC concert")
            if (crnt_item.quality > 0)
              if (crnt_item.name != "Sulfuras, Hand of Ragnaros")
                crnt_item.quality = crnt_item.quality - 1
              end
            end
          else
            crnt_item.quality = crnt_item.quality - crnt_item.quality
          end
        else
          if (crnt_item.quality < 50)
            crnt_item.quality = crnt_item.quality + 1
          end
        end
      end
    end
  end

  private
  def standard_quality_item?(item)
    item.name != "Aged Brie" && 
    item.name != "Backstage passes to a TAFKAL80ETC concert" &&
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def minimum_quality_item?(item)
    item.quality == 0
  end
end
