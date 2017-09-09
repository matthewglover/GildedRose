module BackstagePassable
  def update_quality!
    if expired?
      clear_quality
    else
      increase_quality_by!(increment)
    end
  end

  def increment
    return 3 if lte(5)
    return 2 if lte(10)
    return 1
  end

  def lte(days)
    sell_in <= days
  end
  
  def clear_quality
    @quality = 0
  end
end
