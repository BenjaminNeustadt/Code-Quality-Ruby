require_relative '../lib/report'

RSpec.describe 'Report' do

  describe 'report' do

    it 'initially returns a header' do
      ledger = Report.new(Transaction.new)
      expect(ledger.report).to eq "date || credit || debit || balance\n"
    end

    it 'returns with a transaction event concatenated to the header' do
      transaction = Transaction.new
      transaction.deposit(3000)
      date = Date.today.strftime('%d/%m/%Y')
      ledger = Report.new(transaction)
      expect(ledger.report)
        .to eq "date || credit || debit || balance\n#{date} || 3000 || || 3000\n"
    end

  end

end
