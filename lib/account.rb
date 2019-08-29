class Account
  attr_reader :balance

  def initialize(balance = 0.00)
    @balance = balance.to_f
  end

  def withdraw(amount)
    @balance -= amount
  end
end
