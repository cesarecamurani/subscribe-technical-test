require "./lib/item"
require "./lib/receipt"
require "./lib/taxes_calculator"

class App
  ITEMS_REGEX = /^(\d+)\s+(.+?)\s+at\s+(\d+\.\d{2})$/i.freeze

  def initialize(file_path)
    @file_path = file_path
    @receipt = Receipt.new
  end

  def run
    if File.exist?(@file_path)
      load_items

      @receipt.print_receipt
    else
      puts "Error: File '#{@file_path}' not found. Please provide a valid file path."
    end
  end

  private

  def load_items
    input = File.read(@file_path)

    input.lines.each do |line|
      item = parse_item(line.strip)

      @receipt.add_item(item) if item
    end
  end

  def parse_item(line)
    match = line.match(ITEMS_REGEX)

    unless match
      puts "Error: Line '#{line}' does not match the expected format."

      return
    end

    quantity = match[1].to_i
    name = match[2].strip
    price = match[3].to_f

    item = Item.new(quantity, name, price)

    item.apply_taxes

    item
  end
end

if __FILE__ == $0
  if ARGV.empty?
    puts "Please follow example usage: ruby lib/app.rb <input_file_path>"
  else
    file_path = ARGV[0]

    app = App.new(file_path)

    app.run
  end
end
