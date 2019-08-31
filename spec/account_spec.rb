require 'account'

describe Account do
  subject(:account) { described_class.new }
  it "is instance of the Account class" do
    expect(account).to be_an_instance_of(Account)
  end
  it "should have a balance" do
    expect(account.balance).not_to be(NIL)
  end
  it "should show a float balance even when given a non-float argument" do
    account = Account.new(1)
    expect(account.balance).to be_a(Float)
  end
  describe '#withdraw' do
    it "should decrease balance by 9.99 when 9.99 is withdrawn" do
      initial_balance = account.balance
      account.withdraw(9.99)
      expect(account.balance).to eq(initial_balance - 9.99)
    end
    it 'should accept a date as an argument' do
      expect{account.withdraw(9.99, "01/01/01")}.not_to raise_error
    end
  end
  describe '#deposit' do
    it "should increase balance by 9.99 when 9.99 is deposited" do
      initial_balance = account.balance
      account.deposit(9.99)
      expect(account.balance).to eq(initial_balance + 9.99)
    end
    it 'should accept a date as an argument' do
      expect{ account.deposit(9.99, "01/01/01") }.not_to raise_error
    end
  end
  describe 'transactions_history' do
    it 'stores the history of transactions' do
      expect(account).to respond_to(:transaction_history)
    end
  end

end
