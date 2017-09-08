class Item

  attr_reader :name, :sell_in, :quality
        
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    decrease_sell_in!
    update_quality!
  end

  private
  def expired?
    sell_in < 0
  end

  def minimum_quality?
    quality == 0
  end

  def maximum_quality?
    quality >= 50
  end

  def decrease_quality!
    @quality -= 1
  end

  def increase_quality!
    @quality += 1
  end

  def increase_backstage_quality!
    # NOTE: This code is not being tested
    if sell_in < 11
      unless maximum_quality?
        increase_quality!
      end
    end
    if sell_in < 6
      unless maximum_quality?
        increase_quality!
      end
    end
  end

  def decrease_sell_in!
    @sell_in -= 1
  end
end
