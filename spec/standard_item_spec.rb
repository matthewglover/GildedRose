require "item"
require "updateable"
require "standardable"

describe StandardItem do
  describe "#update" do
    it "decreases sell_in and quality for unexpired item" do
      item = new_item("Item", 10, 20)
      item.update
      expect(item.sell_in).to eq(9)
      expect(item.quality).to eq(19)
    end

    it "decreases quality by 2 when item expired" do
      item = new_item("Item", 0, 20)
      item.update
      expect(item.sell_in).to eq(-1)
      expect(item.quality).to eq(18)
    end

    it "stops decreasing quality at 0" do
      item = new_item("Item", 10, 0)
      item.update
      expect(item.quality).to eq(0)
    end

    it "handles edge cases" do
      item = new_item("Item", -1, 1)
      item.update
      expect(item.quality).to eq(0)
    end

    def new_item(name, sell_in, quality)
      Item.new(name, sell_in, quality).extend(Updateable, Standardable)
    end
  end
end
