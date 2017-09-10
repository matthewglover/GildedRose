require "updateable"

module BackstagePass
  def update_quality!
    if expired?
      clear_quality
    else
      increase_quality_by!(increment)
    end
  end

  def increment
    return 3 if days_remaining(5)
    return 2 if days_remaining(10)
    return 1
  end

  def days_remaining(days)
    sell_in <= days
  end
  
  def clear_quality
    @quality = Updateable::MIN_QUALITY
  end
end
