class Statement

  attr_reader :balance

  def initialize(balance=0.00)
    @balance = balance
  end

  def headers
    'date || credit || debit || balance'
  end

  def debit(amount = 0.00)
    @balance += amount
  end

  def credit(amount = 0.00)
    @balance -= amount
  end

  def withdraw(amount)
    credit(amount)
    return "#{'%.2f' % amount}"
  end

  def deposit(amount)
    debit(amount)
    return "#{'%.2f' % amount}"
  end
end
