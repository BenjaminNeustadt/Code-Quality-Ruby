# EXAMPLES:
# date       || credit    || debit  || balance
# 14/01/2023 ||           || 500.00 || 2500.00
# 13/01/2023 || 2000.00   ||        || 3000.00
# 10/01/2023 || 1000.00   ||        || 1000.00

require_relative '../lib/ledger'

describe Ledger do

  it 'must have a report' do
    # date  || credit  || debit  || balance
    book = Ledger.new(balance: 1000)
    expect(book).to respond_to :report
  end

  describe 'Report' do

    it 'must have date, credit, debit and balance header' do
      # date  || credit  || debit  || balance
      report = Ledger.new(balance: 1000)
        .report.lines.first.downcase # normalized for tests

      expect(report).to include 'debit'
      expect(report).to include 'date'
      expect(report).to include 'credit'
      expect(report).to include 'balance'
    end

  end

  describe 'Credit/Debit' do

    it 'must have a balance' do
      ledger = Ledger.new(balance: 1000)

      expect(ledger.balance).to eq 1000
    end

    it 'must make a credit entry' do
      # date  || credit  || debit  || balance
      # 10/01/2023 || 1000.00   ||        || 1000.00
      ledger        = Ledger.new(balance: 1000)
      ledger.credit = 2000
      balance       = ledger.balance

      expect(balance).to eq 3000
    end

    it 'must make a debit entry' do
      # date  || credit  || debit  || balance
      # 10/01/2023 || 1000.00   ||        || 1000.00
      ledger       = Ledger.new(balance: 1000)
      ledger.debit = 200
      balance      = ledger.balance

      expect(balance).to eq 800
    end

    it 'must give correct balance after credit/debit actions' do
      # date  || credit  || debit  || balance
      # 10/01/2023 || 1000.00   ||        || 1000.00
      ledger        = Ledger.new(balance: 1000)
      ledger.credit = 300
      ledger.debit  = 150
      balance       = ledger.balance

      expect(balance).to eq 1150

      ledger.debit  = 300
      ledger.credit = 5
      balance       = ledger.balance

      expect(balance).to eq 855
    end

    it 'must update the credit/debit instance' do
      ledger        = Ledger.new(balance: 1000)
      ledger.credit = 300
      ledger.debit  = 150

      expect(ledger.credit).to eq 300
    end

  end

end
