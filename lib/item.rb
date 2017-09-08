class Item

  attr_accessor :name, :sell_in, :quality
        
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    decrease_item_sell_in!(self) unless sulfurus_item?(self)

    if standard_quality_item?(self)
      decrease_item_quality!(self) unless minimum_quality_item?(self)
    else
      unless maximum_quality_item?(self)
        increase_item_quality!(self)
        increase_backstage_item_quality!(self) if backstage_item?(self)
      end
    end

    if expired_item?(self)
      if aged_brie_item?(self)  
        increase_item_quality!(self) if maximum_quality_item?(self)
      else
        if backstage_item?(self)
          self.quality = 0
        else
          decrease_item_quality!(self) unless minimum_quality_item?(self) || sulfurus_item?(self)
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
