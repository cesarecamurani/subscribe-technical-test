class Item
  attr_reader :quantity, :name, :price, :applicable_taxes

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
    @applicable_taxes = 0
  end

  def apply_taxes
    @applicable_taxes = TaxesCalculator.calculate_taxes(name, price)
  end

  def total_price
    (price + applicable_taxes) * quantity
  end
end
