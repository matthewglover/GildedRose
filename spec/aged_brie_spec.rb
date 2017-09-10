require "item"
require "updateable"
require "aged_brie"

describe "AgedBrie" do
  describe "#update!" do
    it "increases quality for unexpired item" do
      item = new_item("Item", 10, 20)
      item.update!
      expect(item.sell_in).to eq(9)
      expect(item.quality).to eq(21)
    end

    it "increases quality by 2 when item expired item" do
      item = new_item("Item", 0, 20)
      item.update!
      expect(item.sell_in).to eq(-1)
      expect(item.quality).to eq(22)
    end

    it "stops increasing quality at 50" do
      item = new_item("Item", 10, 50)
      item.update!
      expect(item.quality).to eq(50)
    end
    
    it "handles edge cases" do
      item = new_item("Item", -1, 49)
      item.update!
      expect(item.quality).to eq(50)
    end

    def new_item(name, sell_in, quality)
      Item.new(name, sell_in, quality).extend(AgedBrie, Updateable)
    end
  end
end
