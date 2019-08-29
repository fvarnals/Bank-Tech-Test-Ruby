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
end
