class Item

  attr_reader :name, :sell_in, :quality
        
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    decrease_sell_in!
    update_quality!
  end

  private
  def expired?
    sell_in <= 0
  end

  def decrease_quality_by!(amount)
    updated_quality = @quality - amount
    if (updated_quality < 0)
      @quality = 0
    else
      @quality = updated_quality
    end
  end

  def increase_quality_by!(amount)
    updated_quality = @quality + amount
    if (updated_quality > 50)
      @quality = 50
    else
      @quality = updated_quality
    end
  end

  def minimum_quality?
    quality == 0
  end

  def maximum_quality?
    quality >= 50
  end

  def decrease_sell_in!
    @sell_in -= 1
  end
end
