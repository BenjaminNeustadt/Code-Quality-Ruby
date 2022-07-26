class Ledger

  ENTRY = {date: '', credit: 0, debit: 0, balance: 0}

  private

  attr_writer :balance

  def initialize(date: Time.now, balance: 0)
    @date                     = date
    @balance                  = balance
    credit_or_debit           = balance.positive? ? :credit : :debit
    @history  = [] << ENTRY
    @history.first[:credtor_or_debit] = balance.abs
    @history.first[:date] = date
    @history.first[:balance] = balance
    p @history
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
