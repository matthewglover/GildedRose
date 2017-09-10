module Updateable
  
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def update!
    decrease_sell_in!
    update_quality!
  end

  def expired?
    sell_in <= 0
  end

  def decrease_quality_by!(amount)
    updated_quality = @quality - amount
    if (updated_quality < MIN_QUALITY)
      @quality = MIN_QUALITY
    else
      @quality = updated_quality
    end
  end

  def increase_quality_by!(amount)
    updated_quality = @quality + amount
    if (updated_quality > MAX_QUALITY)
      @quality = MAX_QUALITY
    else
      @quality = updated_quality
    end
  end

  def minimum_quality?
    quality == MIN_QUALITY
  end

  def maximum_quality?
    quality >= MAX_QUALITY
  end

  def decrease_sell_in!
    @sell_in -= 1
  end
end
