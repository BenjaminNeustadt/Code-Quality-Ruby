class Ledger

  def initialize(name, account, date, beginning_balance)
    @name = name
    @account = account
    @date = date
    @balance = beginning_balance
  end

  attr_reader :balance

  def report
    <<~🍌
      date   || credit || debit || Balance
      Today ||  0 ||  50  -> 25
    🍌
  end

end
