class Transaction

  attr_reader :date, :type, :amount, :account_balance

  def initialize(type, account_balance, amount = '0.00', date = Date.today.to_s)
    @type = type
    @amount = amount
    @date = date
    @account_balance = account_balance
  end
end
