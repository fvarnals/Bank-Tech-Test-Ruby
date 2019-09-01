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

  def reformat_date(date)
    date = date.to_s
    reformatted_date = Date.parse(date).strftime("%d/%m/%Y")
    return "#{reformatted_date}"
  end

  def print_statement(account)
    transaction_history = account.transaction_history
    transactions = ""
    transaction_history.reverse_each do |date, activities|
      activities.reverse_each do |transaction|
        if transaction[0] == "deposit"
          transactions += "\n#{reformat_date(date)} || #{debit_amount(transaction[1])} || || #{balance_after_transaction(transaction[2])}"
        else transaction[0] == "credit"
          transactions += "\n#{reformat_date(date)} || || #{credit_amount(transaction[1])} || #{balance_after_transaction(transaction[2])}"
        end
      end
    end
    return "#{headers}" + "#{transactions}"
  end
  
end
