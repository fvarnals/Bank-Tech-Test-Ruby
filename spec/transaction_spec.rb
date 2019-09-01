require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }
  it "is instance of the Transaction class" do
    expect(transaction).to be_an_instance_of(Transaction)
  end
  it 'has a date associated with it' do
    transaction = Transaction.new('2019-09-01')
    expect(transaction.date).to eq('2019-09-01')
  end
end
