require 'statement'

describe Statement do
  it "should have correct headers" do
    expect(subject.headers).to eq('date || credit || debit || balance')
  end
  describe '#debit' do
    it "should respond to #debit" do
      expect(subject).to respond_to(:debit)
    end
    it "should accept a float as an argument" do
      expect{subject.debit(1.00)}.not_to raise_error
    end
    it "should increase balance by 9.99 when 9.99 is debited" do
      initial_balance = subject.balance
      subject.debit(9.99)
      expect(subject.balance).to eq(initial_balance + 9.99)
    end
  end
  describe '#credit' do
    it "should respond to #credit" do
      expect(subject).to respond_to(:credit)
    end
    it "should accept a float as an argument" do
      expect{subject.credit(1.00)}.not_to raise_error
    end
    it "should return amount credited as string" do
      expect(subject.credit(1.00)).to eq("1.00")
    end
  end
end
