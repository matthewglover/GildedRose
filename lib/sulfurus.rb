require "item"

class Sulfurus < Item
  private
  def decrease_sell_in!
  end

  def update_quality!
    increase_quality!
  end
end
