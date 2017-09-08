require "item"

class StandardItem < Item
  private
  def update_quality!
    decrease_quality! unless minimum_quality?
  end
end
