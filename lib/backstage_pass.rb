require "item"

class BackstagePass < Item
  private
  def update_quality!
    unless maximum_quality?
      increase_quality!
      increase_backstage_quality!
    end
  end
end
