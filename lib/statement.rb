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
    transaction_history.reverse_each do |date, activities|
      activities.reverse_each do |transaction|
        if transaction[0] == "deposit"
          transactions += "\n#{date} || #{transaction[1]} || || #{transaction[2]}"
        else transaction[0] == "credit"
          transactions += "\n#{date} || || #{transaction[1]} || #{transaction[2]}"
        end
      end
    end
    return transactions
  end

end
