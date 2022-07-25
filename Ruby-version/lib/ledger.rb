class Ledger

  private

  attr_writer :balance

  def initialize(name, account, date, beginning_balance)
    @name = name
    @account = account
    @date = date
    @balance = beginning_balance
  end

  public

  attr_reader :balance

  def credit(amount)
    self.balance += amount
  end

  def debit(amount)
    self.balance -= amount
  end

  def report
    <<~🍌
      date   || credit || debit || Balance
      Today ||  0 ||  50  -> 25
    🍌
  end

end
