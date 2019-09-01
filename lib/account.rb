require 'date'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0.00)
    @balance = balance.to_f
    @transaction_history = []
  end

  def withdraw(amount, date = Date.today.to_s)
    @balance -= amount
    amount = reformat_to_2dp_string(amount)
    balance = reformat_to_2dp_string(@balance)
    date = reformat_date(date)
    transaction = Transaction.new('withdrawl', balance, amount, date)
    transaction_history.push(transaction)
  end

  def deposit(amount, date = Date.today.to_s)
    @balance += amount
    amount = reformat_to_2dp_string(amount)
    balance = reformat_to_2dp_string(@balance)
    date = reformat_date(date)
    transaction = Transaction.new('deposit', balance, amount, date)
    transaction_history.push(transaction)
  end

  def reformat_to_2dp_string(data)
    "#{'%.2f' % data}"
  end

  def reformat_date(date)
    Date.parse(date).strftime("%d/%m/%Y")
  end
end
