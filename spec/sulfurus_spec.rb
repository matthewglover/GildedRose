require "item"
require "updateable"
require "sulfurus"

describe "Sulfurus" do
  describe "#update!" do
    it "has static quality of 80" do
      item = new_item("item", 0, 80)
      start_sell_in = item.sell_in
      start_quality = item.quality
      item.update!
      expect(item.sell_in).to eq(start_sell_in)
      expect(item.quality).to eq(start_quality)
    end

    def new_item(name, sell_in, quality)
      Item.new(name, sell_in, quality).extend(Sulfurus, Updateable)
    end
  end
end
