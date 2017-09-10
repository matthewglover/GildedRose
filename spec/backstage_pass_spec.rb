require "item"
require "updateable"
require "backstage_pass"

describe "BackstagePass" do
  describe "#update!" do
    it "incresases by 1 when sell by > 10" do
      item = new_item("item", 20, 10)
      item.update!
      expect(item.quality).to eq(11)
    end

    it "incresases by 2 when sell by <= 10 and > 5" do
      item = new_item("item", 11, 10)
      item.update!
      expect(item.quality).to eq(12)
    end

    it "incresases by 3 when sell by <= 5 and > 0" do
      item = new_item("item", 6, 10)
      item.update!
      expect(item.quality).to eq(13)
    end

    it "drops to 0 when sell by == 0" do
      item = new_item("item", 1, 10)
      item.update!
      expect(item.quality).to eq(0)
    end

    def new_item(name, sell_in, quality)
      Item.new(name, sell_in, quality).extend(BackstagePass, Updateable)
    end
  end
end
