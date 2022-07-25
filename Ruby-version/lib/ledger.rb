class Ledger

  private

  attr_writer :balance

  def initialize(name, account, date, beginning_balance)
    @date = date
    balance = beginning_balance
    @history = {date: date, credit: 0, debit: 0, balance: balance}
    credit_or_debit = balance.positive? ? :credit : :debit
    @history[credit_or_debit] = balance.abs
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
