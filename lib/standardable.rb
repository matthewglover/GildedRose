module Standardable
  def update_quality!
    decrease_quality_by!(decrement)
  end

  def decrement
    expired? ? 2 : 1
  end
end
