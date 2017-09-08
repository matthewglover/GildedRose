require "item"

class AgedBrie < Item
  private
  def update_quality!
    increase_quality!
    increase_quality! if expired?
  end
end
