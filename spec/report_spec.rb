require_relative '../lib/report'

RSpec.describe 'Report' do

  describe 'report' do

    it 'initially returns a header' do
      ledger = Report.new(Transaction.new)
      expect(ledger.report)
        .to eq "date || credit || debit || balance\n\n"
    end

    it 'has  header and single entry' do
      transaction = Transaction.new
      transaction.deposit(3000)
      date = Date.today.strftime('%d/%m/%Y')
      actual = Report.new(transaction).report
      expected =
        <<~REPORT
          date || credit || debit || balance
          #{date} || 3000.00 ||  || 3000.00
        REPORT

      expect(actual).to eq expected
    end

    it 'has header and 3 entries in reverse chronological order' do
      transaction = Transaction.new
      transaction.deposit(1000)
      transaction.deposit(2000)
      transaction.withdraw(500)
      actual = Report.new(transaction).report

      date = Date.today.strftime('%d/%m/%Y')
      expected =
        <<~REPORT
          date || credit || debit || balance
          #{date} ||  || 500.00 || 2500.00
          #{date} || 2000.00 ||  || 3000.00
          #{date} || 1000.00 ||  || 1000.00
        REPORT

      expect(actual).to eq expected
    end

  end

end

