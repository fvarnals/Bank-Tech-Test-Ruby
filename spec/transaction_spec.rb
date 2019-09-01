require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new('test') }
  it "is instance of the Transaction class" do
    expect(transaction).to be_an_instance_of(Transaction)
  end
  it 'has a date associated with it' do
    date_today = Date.today.to_s
    expect(transaction.date).to eq(date_today)
    p transaction.date
    p transaction.type
    p transaction.amount
  end
  it 'has a type i.e. deposit' do
    expect(transaction.type).to eq('test')
  end
  it 'has a monetary value associated with it' do
    expect(transaction.amount).to eq(0.00)
  end
end
