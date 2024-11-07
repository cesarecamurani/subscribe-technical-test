RSpec.describe Receipt do
  subject(:receipt) { described_class.new }

  let(:item1) { instance_double("Item", quantity: 2, name: "book", total_price: 24.98, applicable_taxes: 0.0) }
  let(:item2) { instance_double("Item", quantity: 1, name: "music CD", total_price: 16.49, applicable_taxes: 1.50) }
  let(:item3) { instance_double("Item", quantity: 1, name: "chocolate bar", total_price: 0.85, applicable_taxes: 0.0) }

  let(:total_price) { item1.total_price + item2.total_price + item3.total_price }
  let(:total_sales_taxes) do
    item1.applicable_taxes * item1.quantity +
      item2.applicable_taxes * item2.quantity +
        item3.applicable_taxes * item3.quantity
  end

  before do
    receipt.add_item(item1)
    receipt.add_item(item2)
    receipt.add_item(item3)
  end

  describe "#add_item" do
    it "adds an item to the receipt" do
      expect { receipt.add_item(item1) }.to change { subject.instance_variable_get(:@items).length }.by(1)
    end

    it "calculates the total sales taxes correctly" do
      expect(receipt.instance_variable_get(:@total_sales_taxes)).to eq(total_sales_taxes)
    end

    it "calculates the total price correctly" do
      expect(receipt.instance_variable_get(:@total_price)).to eq(total_price)
    end
  end

  describe "#print_receipt" do
    it "prints the correct receipt format for each item" do
      expect { subject.print_receipt }.to output(
        "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n"
      ).to_stdout
    end
  end
end
