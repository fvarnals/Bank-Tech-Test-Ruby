require 'statement'

describe Statement do
  it "should have correct headers" do
    expect(subject.headers).to eq('date || credit || debit || balance')
  end
  describe '#debit_amount' do
    it "should respond to #debit" do
      expect(subject).to respond_to(:debit_amount)
    end
    it "should accept a float as an argument" do
      expect{subject.debit_amount(1.00)}.not_to raise_error
    end
    it "should return amount debited as string" do
      expect(subject.debit_amount(1.0)).to eq("1.00")
    end
  end
  describe '#credit_amount' do
    it "should respond to #credit" do
      expect(subject).to respond_to(:credit_amount)
    end
    it "should accept a float as an argument" do
      expect{subject.credit_amount(1.00)}.not_to raise_error
    end
    it "should return amount credited as string" do
      expect(subject.credit_amount(1.0)).to eq("1.00")
    end
  end
  describe '#balance_after_transaction' do
    it 'returns the balance as a float string, following transaction' do
      expect(subject.balance_after_transaction(2)).to eq("2.00")
    end
  end
  describe '#transaction_date' do
    it 'returns the date for a transaction' do
      expect(subject.transaction_date('27/01/2014')).to eq('27/01/2014')
    end
  end
  describe 'record transactions' do
    it 'stores the history of transactions' do
      expect(subject).to respond_to(:transaction_history)
    end
  end
end
