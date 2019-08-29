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
end
