require "item"

class BackstagePass < Item
  private
  def update_quality!
    increase_quality!
    increase_backstage_quality!
    @quality = 0 if expired?
  end

  def increase_backstage_quality!
    # NOTE: This code is not being tested
    if sell_in < 11
      increase_quality!
    end
    if sell_in < 6
      increase_quality!
    end
  end
end
