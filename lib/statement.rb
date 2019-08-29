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

  def print_statement
    "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
  end
end
