require 'Date'

class Transaction

  private

  attr_writer :balance

  def initialize(balance: 0)
    @balance = balance
    @history = []
  end

  public

  attr_reader :balance, :history, :date

  def deposit(amount)
    self.balance += amount
    history << {
      date:    Date.today.strftime('%d/%m/%Y'),
      credit:  amount,
      debit:   nil,
      balance: balance
    }
  end

  def withdraw(amount)
    self.balance -= amount
    history << {
      date:    Date.today.strftime('%d/%m/%Y'),
      credit:  nil,
      debit:   amount,
      balance: balance
    }
  end

end
