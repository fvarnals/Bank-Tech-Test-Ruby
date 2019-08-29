class Statement

  attr_reader :balance

  def initialize(balance=0.00)
    @balance = balance
  end

  def headers
    'date || credit || debit || balance'
  end

  def debit_amount(amount = 0.00)
    return "#{'%.2f' % amount}"
  end

  def credit_amount(amount = 0.00)
    return "#{'%.2f' % amount}"
  end

end
