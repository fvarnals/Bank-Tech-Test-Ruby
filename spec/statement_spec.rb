require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  it 'should have correct headers' do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end
  describe '#print_statement' do
    it 'should show details of deposit of 100.00 made on 14/01/2012
     with date amount, and balance' do
      account = double(:account)
      transaction = double(date: '14/01/2012', type: 'deposit',
         amount: '100.00', account_balance: '100.00')
      allow(account).to receive(:transaction_history).and_return([transaction])
      expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n14/01/2012 || 100.00 || || 100.00")
    end
    it 'should show transactions in reverse chronological order' do
      account = double(:account)
      transaction_1 = double(date: '14/01/2012', type: 'deposit',
        amount: '100.00', account_balance: '100.00')
      transaction_2 = double(date: '14/01/2012', type: 'withdrawl',
        amount: '100.00', account_balance: '0.00')
      transaction_3 = double(date: '15/01/2012', type: 'deposit',
        amount: '100.00', account_balance: '100.00')
      allow(account).to receive(:transaction_history).and_return([transaction_1, transaction_2, transaction_3])
      expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n15/01/2012 || 100.00 || || 100.00\n14/01/2012 || || 100.00 || 0.00\n14/01/2012 || 100.00 || || 100.00")
    end
  end
end
