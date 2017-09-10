module AgedBrie
  def update_quality!
    increase_quality_by!(increment)
  end

  def increment
    expired? ? 2 : 1
  end
end
