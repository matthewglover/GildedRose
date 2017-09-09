module Updateable
  def update
    decrease_sell_in!
    update_quality!
  end

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
