class Transaction

  attr_reader :date

  def initialize(date = Date.today.to_s)
    @date = date
  end
end
