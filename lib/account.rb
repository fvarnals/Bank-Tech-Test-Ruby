require 'date'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0.00)
    @balance = balance.to_f
    @transaction_history = {}
  end

  def withdraw(amount, date = Date.today.to_s)
    @balance -= amount
    if @transaction_history.key?(date.to_sym)
      @transaction_history[date.to_sym].push(["withdrawl", amount.to_f, @balance])
    else
      @transaction_history[date.to_sym] = [["withdrawl", amount.to_f, @balance]]
    end
  end

  def deposit(amount, date = Date.today.to_s)
    @balance += amount
    if @transaction_history.key?(date.to_sym)
      @transaction_history[date.to_sym].push(["deposit", amount.to_f, @balance])
    else
      @transaction_history[date.to_sym] = [["deposit", amount.to_f, @balance]]
    end
  end

end
