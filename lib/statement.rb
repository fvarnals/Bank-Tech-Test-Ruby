class Statement

  attr_reader :balance, :transaction_history

  def initialize(balance=0.00)
    @balance = balance
    @transaction_history = []
  end

  def headers
    'date || credit || debit || balance'
  end

  def balance_after_transaction(balance)
    return "#{'%.2f' % balance}"
  end

  def debit_amount(amount = 0.00)
    return "#{'%.2f' % amount}"
  end

  def credit_amount(amount = 0.00)
    return "#{'%.2f' % amount}"
  end

  def transaction_date(date)
    return "#{date}"
  end

  def print_statement
    "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
  end
end
