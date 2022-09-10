class Transaction

  def initialize(balance: 0)
    @balance = balance
  end

  attr_reader :balance

  def deposit(amount)
    @balance += amount
  end

end
