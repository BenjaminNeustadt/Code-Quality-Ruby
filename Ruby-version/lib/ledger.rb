class Ledger

  private

  attr_writer :balance

  def initialize(date: Time.now, balance: 0)
    @date                     = date
    @balance                  = balance
    @history                  = {date: date, credit: 0, debit: 0, balance: balance}
    credit_or_debit           = balance.positive? ? :credit : :debit
    @history[credit_or_debit] = balance.abs
    @debit                    = 0
    @credit                   = 0
  end

  public

  attr_reader :balance, :credit, :debit

  def credit=(amount)
    @credit       = amount
    self.balance += credit
  end

  def debit=(amount)
    @debit        = amount
    self.balance -= debit
  end

  def report
    <<~🍌
      date   || credit || debit || Balance
      Today ||  0 ||  50  -> 25
    🍌
  end

end
