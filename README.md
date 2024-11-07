# Sales Taxes Calculator

This project is a Sales Taxes Calculator that reads items from a file, calculates the applicable taxes, and prints a receipt with the total price and sales taxes.

### Tax Application Rules

- The Sales Taxes Calculator applies two types of taxes: basic sales tax and import duty. 
- Basic sales tax is applied at a rate of 10% on all goods, except for books, food, and medical products, which are exempt. 
- Import duty is an additional tax of 5% on all imported goods, with no exemptions. 
- The total tax for an item is the sum of the basic sales tax and import duty, if applicable. 
- Taxes are rounded up to the nearest 0.05 for each item. 
- The receipt lists the name of each item, its price including tax, the total sales taxes, and the total cost of all items.

### Ruby Version
```
3.3.5
```

### RSpec Version
```
3.13.0
```

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Running the App](#running-the-app)
- [Handling Errors](#handling-errors)
- [Running Specs](#running-specs)

## Installation

1. Clone the repository:

  ```sh
  git clone https://github.com/cesarecamurani/subscribe-technical-test.git
  cd subscribe-technical-test
  ```

2. Install the dependencies:

  ```sh
  bundle install
  ```

## Usage

To use the Sales Taxes Calculator, you need to provide an input file with the list of items. The format of the input file should be as follows:

```
<quantity> <product> at <price>
```

For example:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

## Running the App

To run the app, please execute the following command:

```sh
ruby app.rb input_files/file.txt
```

Replace `file.txt` with the actual name of your input file.

### Example Output

```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Handling Errors

### File Not Found

If the specified file does not exist, the app will print the following error message:

```sh
Error: File 'path/to/your/input_file.txt' not found. Please provide a valid file path.
```

### Invalid Line Format

If a line in the input file does not match the expected format, the app will print an error message for that line:

```sh
Error: Line 'invalid line content' does not match the expected format.
```

## Running Specs

To run the specs, use the following command:

```sh
bundle exec rspec
```

This will execute all the tests in the spec directory and provide you with the results.

### Spec Files

To run the specs for a specific file, you can use the following command:

```sh
bundle exec rspec spec/<file_name>.rb
```

`spec/app_spec.rb`: Tests for the `App` class.
`spec/item_spec.rb`: Tests for the `Item` class.
`spec/receipt_spec.rb`: Tests for the `Receipt` class.
`spec/taxes_calculator_spec.rb`: Tests for the `TaxesCalculator` class.

### Example Output

```
  App
    #run
      when the file exists
        loads items and prints the receipt
      when the file does not exist
        prints an error message

  Item
    #initialize
      initializes with quantity, name, and price
    #apply_taxes
      calculates and applies taxes
    #total_price
      calculates the total price including taxes

  Receipt
    #add_item
      adds an item to the receipt
      calculates the total sales taxes correctly
      calculates the total price correctly
    #print_receipt
      prints the correct receipt format for each item

  TaxesCalculator
    .calculate_taxes
      when the item is non-exempt
        correctly calculates taxes
      when the item is exempt
        does not apply taxes
      when the item is exempt but imported
        correctly calculates taxes
      when the item is non-exempt and imported
        correctly calculates taxes

  Finished in 0.0049 seconds (files took 0.07802 seconds to load)
  13 examples, 0 failures
```
