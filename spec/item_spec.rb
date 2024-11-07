RSpec.describe Item do
  subject(:item) { described_class.new(quantity, name, price) }

  let(:quantity) { 3 }
  let(:name) { "imported boxes of chocolate" }
  let(:price) { 11.25 }

  before { item.apply_taxes }

  describe "#initialize" do
    it "initializes with quantity, name, and price" do
      expect(item.quantity).to eq(quantity)
      expect(item.name).to eq(name)
      expect(item.price).to eq(price)
    end
  end

  describe "#apply_taxes" do
    it "calculates and applies taxes" do
      expect(item.applicable_taxes).to eq(0.6)
    end
  end

  describe "#total_price" do
    it "calculates the total price including taxes" do
      expect(item.total_price).to eq(35.55)
    end
  end
end
