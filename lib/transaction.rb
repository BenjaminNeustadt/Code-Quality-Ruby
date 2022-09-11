require 'Date'
require_relative 'report.rb'

class Transaction

  MONEY = '%.2f'
  REPORT = ->(transactions) { Report.new(transactions) }

  private_constant :MONEY, :REPORT

  private

  attr_writer :balance
  attr_reader :report

  def initialize(balance: 0, report: REPORT)
    @balance = balance
    @history = []
    @report = report
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

  def to_s
    report[self].to_s
  end

end

