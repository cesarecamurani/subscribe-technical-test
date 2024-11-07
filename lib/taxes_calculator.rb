class TaxesCalculator
  BASIC_SALES_TAX_RATE = 0.10.freeze
  IMPORT_DUTY_TAX_RATE = 0.05.freeze

  IMPORTED = "imported".freeze
  EXEMPT_ITEMS = %w[book chocolate pill].freeze

  class << self
    def calculate_taxes(item_name, price)
      tax_rate = 0

      tax_rate += IMPORT_DUTY_TAX_RATE if imported_good?(item_name)

      tax_rate += BASIC_SALES_TAX_RATE unless exempted_good?(item_name)

      round_to_nearest_0_05(price * tax_rate)
    end

    private

    def imported_good?(item_name)
      item_name.downcase.include?(IMPORTED)
    end

    def exempted_good?(item_name)
      EXEMPT_ITEMS.any? do |exempted_item|
        item_name.downcase.match?(/\b#{Regexp.escape(exempted_item)}s?\b/)
      end
    end

    def round_to_nearest_0_05(amount)
      (amount * 20).ceil / 20.0
    end
  end
end
