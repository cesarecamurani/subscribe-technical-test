require "bigdecimal"
require "bigdecimal/util"

class TaxesCalculator
  BASIC_SALES_TAX_RATE = 0.10.freeze
  IMPORT_DUTY_TAX_RATE = 0.05.freeze

  IMPORTED_KEY = "imported".freeze
  EXEMPT_ITEMS = %w[book chocolate pill oil tea].freeze

  class << self
    def calculate_taxes(item_name, price)
      tax_rate = BigDecimal("0")

      tax_rate += IMPORT_DUTY_TAX_RATE if imported_item?(item_name)

      tax_rate += BASIC_SALES_TAX_RATE unless exempt_item?(item_name)

      round_to_nearest_0_05(price.to_d * tax_rate)
    end

    private

    def imported_item?(item_name)
      item_name.downcase.include?(IMPORTED_KEY)
    end

    def exempt_item?(item_name)
      EXEMPT_ITEMS.any? do |exempt_item|
        item_name.downcase.match?(/\b#{Regexp.escape(exempt_item)}s?\b/)
      end
    end

    def round_to_nearest_0_05(amount)
      (amount * 20).ceil / 20.0
    end
  end
end
