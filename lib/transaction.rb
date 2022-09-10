class Transaction

  private

  attr_writer :balance

  def initialize(balance: 0)
    @balance = balance
    @history = []
  end

  public

  attr_reader :balance, :history

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

end
