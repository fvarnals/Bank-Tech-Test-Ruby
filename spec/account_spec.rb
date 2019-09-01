require 'account'

describe Account do
  subject(:account) { described_class.new }
  subject(:date_today) { Date.parse(Date.today.to_s).strftime("%d/%m/%Y") }
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
    it 'creates a new transaction object' do
      expect(account.withdraw(9.99)).to be_an_instance_of(Transaction)
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
    it 'creates a new transaction object' do
      expect(account.deposit(9.99)).to be_an_instance_of(Transaction)
    end
  end
  describe 'transactions_history' do
    it 'stores the history of transactions' do
      expect(account).to respond_to(:transaction_history)
    end
    it 'should be empty when no transactions have been made' do
      expect(account.transaction_history).to be_empty
    end
    it 'should show a withdrawl of 100 made today, with current balance, when this transaction is made' do
      account = Account.new(100)
      account.withdraw(100)
      expect(account.transaction_history).to eq({"#{date_today}": [["withdrawl", "100.00", "0.00"]]})
    end
    it 'should show a withdrawl of 200 made today, with current balance, when this transaction is made' do
      account = Account.new(300)
      account.withdraw(200)
      expect(account.transaction_history).to eq({"#{date_today}": [["withdrawl", "200.00", "100.00"]]})
    end
    it 'should show a deposit of 100 made today, with current balance, when this transaction is made' do
      account = Account.new(100)
      account.deposit(100)
      expect(account.transaction_history).to eq({"#{date_today}": [["deposit", "100.00", "200.00"]]})
    end
    it 'should add a new transaction to same date, when multiple transactions are made on same day' do
      account = Account.new(200)
      account.withdraw(100, "01/01/1901")
      account.deposit(50, "01/01/1901")
      expect(account.transaction_history).to eq({"01/01/1901": [["withdrawl", "100.00", "100.00"],["deposit", "50.00", "150.00"]]})
    end
    it 'should record dates in DD/MM/YYYY format when no date argument is given' do
      account.withdraw(100)
      expect(account.transaction_history.keys[0]).to eq(date_today.to_sym)
    end
    it 'should record dates in format DD/MM/YYYY' do
      account.withdraw(100, '2019-09-01')
      expect(account.transaction_history.keys[0]).to eq(:'01/09/2019')
    end
  end

end
