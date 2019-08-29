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
    it "should decrease balance by 9.99 when 9.99 is credited" do
      initial_balance = subject.balance
      subject.credit(9.99)
      expect(subject.balance).to eq(initial_balance - 9.99)
    end
  end
  describe '#withdrawal' do
    it 'should return the amount withdrawn as a string float' do
      expect(subject.withdraw(10.00)).to eq('10.00')
    end
    it "should decrease balance by 9.99 when 9.99 is withdrawn" do
      initial_balance = subject.balance
      subject.withdraw(9.99)
      expect(subject.balance).to eq(initial_balance - 9.99)
    end
  end
  describe '#deposit' do
    it 'should return the amount deposited as a string float' do
      expect(subject.deposit(10.00)).to eq('10.00')
    end
    it "should increase balance by 9.99 when 9.99 is deposited" do
      initial_balance = subject.balance
      subject.deposit(9.99)
      expect(subject.balance).to eq(initial_balance + 9.99)
    end
  end
end
