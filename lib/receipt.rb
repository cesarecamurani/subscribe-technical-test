class Receipt
  def initialize
    @items = []
    @total_sales_taxes = 0.0
    @total_price = 0.0
  end

  def add_item(item)
    @items << item

    @total_sales_taxes += item.applicable_taxes * item.quantity
    @total_price += item.total_price
  end

  def print_receipt
    @items.each do |item|
      puts "#{item.quantity} #{item.name}: #{format('%.2f', item.total_price)}"
    end

    puts "Sales Taxes: #{format('%.2f', @total_sales_taxes)}"
    puts "Total: #{format('%.2f', @total_price)}"
  end
end
