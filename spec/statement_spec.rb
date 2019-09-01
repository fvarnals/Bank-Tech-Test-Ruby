require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  it "should have correct headers" do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end
  
  describe 'record transactions' do
    it 'stores the history of transactions' do
      expect(statement).to respond_to(:transaction_history)
    end
  end
  describe '#print_statement' do
    it 'should show details of deposit of 100.00 made on 14/01/2012 with date amount, and balance' do
      account = double(:account)
      allow(account).to receive(:transaction_history).and_return({"14/01/2012": [["deposit", "100.00", "100.00"]]})
      expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n14/01/2012 || 100.00 || || 100.00")
    end
    it 'should show transactions in reverse chronological order' do
      account = double(:account)
      allow(account).to receive(:transaction_history).and_return({"14/01/2012": [["deposit", "100.00", "100.00"],["withdrawl", "100.00", "0.00"]], "15/01/2012": [["deposit", "100.00", "100.00"]]})
      expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n15/01/2012 || 100.00 || || 100.00\n14/01/2012 || || 100.00 || 0.00\n14/01/2012 || 100.00 || || 100.00")
    end
  end
end
