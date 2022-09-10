require 'Date'

class Transaction

  private

  attr_writer :balance

  def initialize(balance: 0)
    @balance = balance
    @history = []
  end

  def entry(balance:, debit: nil, credit: nil)
    history << {
      date:    Date.today.strftime('%d/%m/%Y'),
      credit:  credit,
      debit:   debit,
      balance: balance
    }
  end

  public

  attr_reader :balance, :history, :date

  def deposit(amount)
    entry(balance: self.balance += amount, credit: amount)
  end

  def withdraw(amount)
    entry(balance: self.balance -= amount, debit: amount)
  end

end

