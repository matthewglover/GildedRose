class Item

  attr_reader :name, :sell_in, :quality
        
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    decrease_sell_in!

    if standard_quality?
      decrease_quality! unless minimum_quality?
    else
      unless maximum_quality?
        increase_quality!
        increase_backstage_quality! if backstage?
      end
    end

    if expired?
      if aged_brie?  
        increase_quality! if maximum_quality?
      else
        if backstage?
          @quality = 0
        else
          decrease_quality! unless minimum_quality? || sulfurus?
        end
      end
    end
  end

  private
  def expired?
    sell_in < 0
  end

  private
  def aged_brie?
    name == "Aged Brie"
  end

  def standard_quality?
    name != "Aged Brie" && 
    name != "Backstage passes to a TAFKAL80ETC concert" &&
    name != "Sulfuras, Hand of Ragnaros"
  end

  def minimum_quality?
    quality == 0
  end

  def maximum_quality?
    quality >= 50
  end

  def decrease_quality!
    @quality -= 1
  end

  def increase_quality!
    @quality += 1
  end

  def backstage?
    name =~ /^Backstage.+/
  end

  def increase_backstage_quality!
    # NOTE: This code is not being tested
    if sell_in < 11
      unless maximum_quality?
        increase_quality!
      end
    end
    if sell_in < 6
      unless maximum_quality?
        increase_quality!
      end
    end
  end

  def decrease_sell_in!
    @sell_in -= 1
  end

  def sulfurus?
    name == "Sulfuras, Hand of Ragnaros"
  end
end
