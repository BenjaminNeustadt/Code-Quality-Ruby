require 'Date'

class Transaction

  MONEY = '%.2f'

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
      balance: MONEY % balance
    }
  end

  public

  attr_reader :balance, :history, :date

  def deposit(amount)
    entry(balance: self.balance += amount, credit: MONEY % amount)
  end

  def withdraw(amount)
    entry(balance: self.balance -= amount, debit: MONEY % amount)
  end

end

