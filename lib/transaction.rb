class Transaction

  private

  attr_writer :balance

  def initialize(balance: 0)
    @balance = balance
  end

  public

  attr_reader :balance

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

end
