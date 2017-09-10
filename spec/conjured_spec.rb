require "item"
require "updateable"
require "conjured"

describe "Conjured" do
  describe "#update!" do
    it "decreases by 2 before expiry" do
      item = new_item("item", 20, 10)
      item.update!
      expect(item.quality).to eq(8)
    end

    it "decreases by 4 after expiry" do
      item = new_item("item", 0, 10)
      item.update!
      expect(item.quality).to eq(6)
    end

    def new_item(name, sell_in, quality)
      Item.new(name, sell_in, quality).extend(Conjured, Updateable)
    end
  end
end
