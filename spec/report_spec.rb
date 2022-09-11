require_relative '../lib/report'

RSpec.describe 'Report' do

  describe 'report' do

    it 'initially returns a header' do
      ledger = Report.new
      expect(ledger.report).to eq 'date || credit || debit || balance\n'
    end

  end

end

