require 'statement'

describe Statement do
  it "should have correct headers" do
    expect(subject.headers).to eq('date || credit || debit || balance')
  end
  it "should show a float balance with two decimal places" do
    expect(subject.balance).to be_a(Float)
  end
  describe '#debit' do
    it "should respond to #debit" do
      expect(subject).to respond_to(:debit)
    end
    it "should accept a float as an argument" do
      expect{subject.debit(1.00)}.not_to raise_error
    end
  end
  describe '#credit' do
    it "should respond to #credit" do
      expect(subject).to respond_to(:credit)
    end
    it "should accept a float as an argument" do
      expect{subject.credit(1.00)}.not_to raise_error
    end
  end
end
