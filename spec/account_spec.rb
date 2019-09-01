require 'account'

describe Account do
  subject(:account) { described_class.new }
  subject(:date_today) { Date.parse(Date.today.to_s).strftime("%d/%m/%Y") }
  it 'is instance of the Account class' do
    expect(account).to be_an_instance_of(Account)
  end
  it 'should have a balance' do
    expect(account.balance).not_to be(NIL)
  end
  it 'should show a float balance even when given a non-float argument' do
    account = Account.new(1)
    expect(account.balance).to be_a(Float)
  end
  describe '#withdraw' do
    it 'should decrease balance by 9.99 when 9.99 is withdrawn' do
      initial_balance = account.balance
      account.transaction('withdraw', 9.99)
      expect(account.balance).to eq(initial_balance - 9.99)
    end
    it 'should accept a date as an argument' do
      expect { account.transaction('withdraw', 9.99, "01/01/01") }.not_to raise_error
    end
    it 'creates a new transaction object' do
      account.transaction('withdraw', 9.99)
      expect(account.transaction_history[-1]).to be_an_instance_of(Transaction)
    end
  end
  describe '#deposit' do
    it 'should increase balance by 9.99 when 9.99 is deposited' do
      initial_balance = account.balance
      account.transaction('deposit', 9.99)
      expect(account.balance).to eq(initial_balance + 9.99)
    end
    it 'should accept a date as an argument' do
      expect{ account.transaction('deposit', 9.99, '01/01/01') }.not_to raise_error
    end
    it 'creates a new transaction object' do
      account.transaction('deposit', 9.99)
      expect(account.transaction_history[-1]).to be_an_instance_of(Transaction)
    end
  end
  describe 'transactions_history' do
    it 'stores the history of transactions' do
      expect(account).to respond_to(:transaction_history)
    end
    it 'should be empty when no transactions have been made' do
      expect(account.transaction_history).to be_empty
    end
    it 'should record dates in DD/MM/YYYY format when no date argument is given' do
      account.transaction('withdraw', 100)
      transaction = account.transaction_history[-1]
      expect(transaction.date).to eq(date_today)
    end
    it 'should record dates in format DD/MM/YYYY' do
      account.transaction('withdraw', 100, '2019-09-01')
      transaction = account.transaction_history[-1]
      expect(transaction.date).to eq('01/09/2019')
    end
  end

end
