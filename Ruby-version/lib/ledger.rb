class Ledger
  def initialize(name, account, date, beginning_balance)
    @name = name
    @account = account
    @date = date
    @beginning_balance = beginning_balance
  end

  def report
    <<~🍌
      date   || credit || debit || Balance
      Today ||  0 ||  50  -> 25
    🍌
  end
end
