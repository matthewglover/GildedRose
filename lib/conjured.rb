module Conjured
  def update_quality!
    decrease_quality_by!(decrement)
  end

  def decrement
    expired? ? 4 : 2
  end
end
