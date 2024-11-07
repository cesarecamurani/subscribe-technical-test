RSpec.describe TaxesCalculator do
  subject(:taxes_calculator) { described_class }

  let(:name) { "music CD" }
  let(:price) { 14.99 }
  let(:taxes) { taxes_calculator.calculate_taxes(name, price) }

  describe ".calculate_taxes" do
    context "when the item is non-exempt" do
      it "correctly calculates taxes" do
        expect(taxes).to eq(1.50)
      end
    end

    context "when the item is exempt" do
      let(:name) { "book" }
      let(:price) { 12.49 }

      it "does not apply taxes" do
        expect(taxes).to eq(0.0)
      end
    end

    context "when the item is exempt but imported" do
      let(:name) { "imported box of chocolates" }
      let(:price) { 10.00 }

      it "correctly calculates taxes" do
        expect(taxes).to eq(0.50)
      end
    end

    context "when the item is non-exempt and imported" do
      let(:name) { "imported bottle of perfume" }
      let(:price) { 47.50 }

      it "correctly calculates taxes" do
        expect(taxes).to eq(7.15)
      end
    end
  end
end
