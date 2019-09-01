class Transaction

  attr_reader :date, :type

  def initialize(type, date = Date.today.to_s)
    @type = type
    @date = date
  end
end
