require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }
  it "is instance of the Transaction class" do
    expect(transaction).to be_an_instance_of(Transaction)
  end
end
