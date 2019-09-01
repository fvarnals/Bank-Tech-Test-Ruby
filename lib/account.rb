require 'date'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0.00)
    @balance = balance.to_f
    @transaction_history = {}
  end

  def withdraw(amount, date = Date.today.to_s)
    @balance -= amount
    amount_string = reformat_to_2dp_string(amount)
    balance_string = reformat_to_2dp_string(@balance)
    date = reformat_date(date)
    if @transaction_history.key?(date.to_sym)
      @transaction_history[date.to_sym].push(["withdrawl", amount_string, balance_string])
    else
      @transaction_history[date.to_sym] = [["withdrawl", amount_string, balance_string]]
    end
    Transaction.new('withdrawl', balance, amount, date)
  end

  def deposit(amount, date = Date.today.to_s)
    @balance += amount
    amount_string = reformat_to_2dp_string(amount)
    balance_string = reformat_to_2dp_string(@balance)
    date = reformat_date(date)
    if @transaction_history.key?(date.to_sym)
      @transaction_history[date.to_sym].push(["deposit", amount_string, balance_string])
    else
      @transaction_history[date.to_sym] = [["deposit", amount_string, balance_string]]
    end
    Transaction.new('deposit', balance, amount, date)
  end

  def reformat_to_2dp_string(data)
    "#{'%.2f' % data}"
  end

  def reformat_date(date)
    Date.parse(date).strftime("%d/%m/%Y")
  end
end
