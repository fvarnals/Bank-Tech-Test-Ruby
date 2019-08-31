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
  describe '#transaction_date' do
    it 'returns the date for a transaction' do
      expect(statement.transaction_date('27/01/2014')).to eq('27/01/2014')
    end
  end
  describe 'record transactions' do
    it 'stores the history of transactions' do
      expect(statement).to respond_to(:transaction_history)
    end
  end
  describe '#print_statement' do
    it 'should return a list of all transactions under specified headers' do
      statement.debit_amount(1000)
      statement.debit_amount(2000)
      statement.credit_amount(500)
      expect(statement.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
    end
  end
end
