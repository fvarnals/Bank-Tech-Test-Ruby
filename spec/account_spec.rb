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
    it 'should be empty when no transactions have been made' do
      expect(account.transaction_history).to be_empty
    end
    it 'should show a withdrawl of 100 on 01/01/01, with current balance, when this transaction is made' do
      account = Account.new(100)
      account.withdraw(100, "01/01/1901")
      expect(account.transaction_history).to eq({"1901-01-01": [["withdrawl", 100.0, 0.0]]})
    end
    it 'should show a withdrawl of 200 on 02/02/02, with current balance, when this transaction is made' do
      account = Account.new(300)
      account.withdraw(200, "02/02/1902")
      expect(account.transaction_history).to eq({"1902-02-02": [["withdrawl", 200.0, 100.0]]})
    end
    it 'should show a deposit of 100 on 01/01/01, with current balance, when this transaction is made' do
      account = Account.new(100)
      account.deposit(100, "01/01/1901")
      expect(account.transaction_history).to eq({"1901-01-01": [["deposit", 100.0, 200.0]]})
    end
    it 'should add a new transaction to same date, when multiple transactions are made on same day' do
      account = Account.new(200)
      account.withdraw(100, "01/01/1901")
      account.deposit(50, "01/01/1901")
      expect(account.transaction_history).to eq({"1901-01-01": [["withdrawl", 100.0, 100.0],["deposit", 50.0, 150.0]]})
    end
    it 'should record today''s date for a transaction when no date is passed as an argument' do
      date_today = Date.today.to_s
      account.withdraw(100)
      expect(account.transaction_history.keys[0]).to eq(date_today.to_sym)
    end
    it 'should record dates in ISO format (YYYY-MM-DD) when no date argument is given' do
      account.withdraw(100)
      expect(account.transaction_history.keys[0]).to be_an_iso_formatted_date
    end
    it 'should record dates in ISO format even when given DD/MM/YYYY' do
      account.withdraw(100, '01/01/1901')
      expect(account.transaction_history.keys[0]).to be_an_iso_formatted_date
    end
  end

end
