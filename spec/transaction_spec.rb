require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new('test', 100) }
  it "is instance of the Transaction class" do
    expect(transaction).to be_an_instance_of(Transaction)
  end
  it 'has a date associated with it' do
    date_today = Date.today.to_s
    expect(transaction.date).to eq(date_today)
  end
  it 'has a type i.e. deposit' do
    expect(transaction.type).to eq('test')
  end
  it 'has a monetary value associated with it' do
    expect(transaction.amount).to eq('0.00')
  end
  it 'records the resultant balance of the account it is associated with' do
    expect(transaction.account_balance).to eq(100.00)
  end
end
