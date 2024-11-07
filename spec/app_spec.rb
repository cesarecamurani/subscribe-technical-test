require "app"

RSpec.describe App do
  subject(:app) { described_class.new(file_path) }

  let(:file_path) { "spec/fixtures/test_input.txt" }

  describe "#run" do
    context "when the file exists" do
      it "loads items and prints the receipt" do
        expect { app.run }.to output(
          "2 book: 24.98\n" \
          "1 music CD: 16.49\n" \
          "1 chocolate bar: 0.85\n" \
          "Sales Taxes: 1.50\n" \
          "Total: 42.32\n"
        ).to_stdout
      end
    end

    context "when the file does not exist" do
      let(:file_path) { "spec/fixtures/non_existent_file.txt" }

      it "prints an error message" do
        expect { app.run }.to output("Error: File '#{file_path}' not found. Please provide a valid file path.\n").to_stdout
      end
    end
  end
end
