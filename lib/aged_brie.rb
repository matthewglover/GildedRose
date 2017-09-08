require "item"

class AgedBrie < Item
  private
  def update_quality!
    increase_quality! unless maximum_quality?
  end
end
