# EXAMPLES:
# date       || credit    || debit  || balance
# 14/01/2023 ||           || 500.00 || 2500.00
# 13/01/2023 || 2000.00   ||        || 3000.00
# 10/01/2023 || 1000.00   ||        || 1000.00

require_relative '../lib/ledger'

describe Ledger do
  it 'must have a report' do
    # date  || credit  || debit  || balance
    book = Ledger.new('Joe', '11234', Time.now, 1000)
    expect(book).to respond_to :report
  end

  describe 'Report' do
    it 'must have date, credit, debit and balance header' do
      # date  || credit  || debit  || balance
      report = Ledger.new('Joe', '11234', Time.now, 1000)
        .report.lines.first.downcase # normalized for tests

      expect(report).to include 'debit'
      expect(report).to include 'date'
      expect(report).to include 'credit'
      expect(report).to include 'balance'
    end
  end

end
