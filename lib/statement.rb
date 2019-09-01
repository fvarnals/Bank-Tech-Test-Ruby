class Statement

  attr_reader :balance, :transaction_history

  def initialize(balance=0.00)
    @balance = balance
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

  def print_statement(account)
    # "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
    transaction_history = account.transaction_history
    transactions = ""
    transaction_history.each do |date, activities|
      activities.each do |transaction|
        if transaction[0] == "Withdrawl"
          transactions += "\n#{date} || #{transaction[1]} || || #{transaction[2]}"
        else transaction[0] == "deposit"
          transactions += "\n#{date} || || #{debit_amount(transaction[1])} || #{balance_after_transaction(transaction[2])}"
        end
      puts activities
      end
    end
    return "#{headers}" + "#{transactions}"
  end
end
