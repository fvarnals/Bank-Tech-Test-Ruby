class Transaction

  attr_reader :date, :type, :amount

  def initialize(type, amount = 0.00, date = Date.today.to_s)
    @type = type
    @amount = amount
    @date = date
  end
end
