require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  it "should have correct headers" do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end

  describe '#debit_amount' do
    it "should respond to #debit_amount" do
      expect(statement).to respond_to(:debit_amount)
    end
    it "should accept a float as an argument" do
      expect{statement.debit_amount(1.00)}.not_to raise_error
    end
    it "should return amount debited as string" do
      expect(statement.debit_amount(1.0)).to eq("1.00")
    end
  end
  describe '#credit_amount' do
    it "should respond to #credit" do
      expect(statement).to respond_to(:credit_amount)
    end
    it "should accept a float as an argument" do
      expect{statement.credit_amount(1.00)}.not_to raise_error
    end
    it "should return amount credited as string" do
      expect(statement.credit_amount(1.0)).to eq("1.00")
    end
  end
  describe '#balance_after_transaction' do
    it 'returns the balance as a float string, following transaction' do
      expect(statement.balance_after_transaction(2)).to eq("2.00")
    end
  end
  describe '#reformat_date' do
    it 'returns the date for a transaction' do
      expect(statement.reformat_date('2014-01-27')).to eq('27/01/2014')
    end
  end
  describe 'record transactions' do
    it 'stores the history of transactions' do
      expect(statement).to respond_to(:transaction_history)
    end
  end
  describe '#print_statement' do
    it 'should show details of deposit of 100.00 made on 14/01/2012 with date amount, and balance' do
      account = double(:account)
      allow(account).to receive(:transaction_history).and_return({"2012-01-14": [["deposit", 100.0, 100.0]]})
      expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n14/01/2012 || || 100.00 || 100.00")
    end
  end
end
