class Statement

  attr_reader :balance

  def initialize(balance=0.00)
    @balance = balance
  end

  def headers
    'date || credit || debit || balance'
  end

  def deposit
  end

  def credit(amount = 0.00)
  end
end
