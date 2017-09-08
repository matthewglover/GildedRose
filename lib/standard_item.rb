require "item"

class StandardItem < Item
  private
  def update_quality!
    decrease_quality!
    decrease_quality! if expired?
  end
end
