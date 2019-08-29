require 'account'

describe Account do
  it "is instance of the Account class" do
    expect(subject).to be_an_instance_of(Account)
  end
  it "should have a balance" do
    expect(subject.balance).not_to be(NIL)
  end
  it "should show a float balance even when given a non-float argument" do
    account = Account.new(1)
    expect(account.balance).to be_a(Float)
  end
  describe '#withdraw' do
    it "should decrease balance by 9.99 when 9.99 is withdrawn" do
      initial_balance = subject.balance
      subject.withdraw(9.99)
      expect(subject.balance).to eq(initial_balance - 9.99)
    end
  end
  describe '#deposit' do
    it "should increase balance by 9.99 when 9.99 is deposited" do
      initial_balance = subject.balance
      subject.deposit(9.99)
      expect(subject.balance).to eq(initial_balance + 9.99)
    end
  end
end
