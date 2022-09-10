require 'Date'

class Transaction

  private

  attr_writer :balance

  def initialize(balance: 0)
    @balance = balance
    @history = []
    @date = Date.today.strftime('%d/%m/%Y')
  end

  public

  attr_reader :balance, :history, :date

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

end
