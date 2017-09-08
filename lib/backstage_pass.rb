require "item"

class BackstagePass < Item
  private
  def update_quality!
    unless maximum_quality?
      increase_quality!
      increase_backstage_quality!
      @quality = 0 if expired?
    end
  end
end
