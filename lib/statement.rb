class Statement

  attr_reader :balance, :transaction_history

  def initialize(balance=0.00)
    @balance = balance
  end

  def headers
    'date || credit || debit || balance'
  end

  def print_statement(account)
    transaction_history = account.transaction_history
    formatted_transactions = format_transactions(transaction_history)
    return "#{headers}" + "#{formatted_transactions}"
  end

  def format_transactions(transaction_history)
    transactions = ""
    transaction_history.reverse_each do |transaction|
      if transaction.type == "deposit"
        transactions += "\n#{transaction.date} || #{transaction.amount} || || #{transaction.account_balance}"
      else transaction.type == "credit"
        transactions += "\n#{transaction.date} || || #{transaction.amount} || #{transaction.account_balance}"
      end
    end
    return transactions
  end

end
