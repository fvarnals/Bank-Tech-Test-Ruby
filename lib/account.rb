require 'date'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0.00)
    @balance = balance.to_f
    @transaction_history = {}
  end

  def withdraw(amount, date = Date.today.to_s)
    @balance -= amount
    @transaction_history[:"01/01/01"] = ["withdrawl", 100, 0]
  end

  def deposit(amount, date = Date.today.to_s)
    @balance += amount
  end
end
