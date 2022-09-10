require_relative '../lib/transaction'

RSpec.describe Transaction do

  describe 'balance' do

    it 'initially has a balance of zero' do
      transaction = Transaction.new
      expect(transaction.balance).to eq 0
    end

    it 'increments balance when amount is deposited' do
      transaction = Transaction.new
      transaction.deposit(100)
      expect(transaction.balance).to eq 100
    end

    it 'decrements balance when amount is withdrawn' do
      transaction = Transaction.new
      transaction.withdraw(100)
      expect(transaction.balance).to eq -100
    end

  end

  describe 'history' do

    it 'initially is an empty array' do
      transaction = Transaction.new
      expect(transaction.history).to eq []
    end

    it 'contains a date property formatted in dd/mm/YYYY' do
      transaction = Transaction.new
      transaction.deposit(100)
      expect(transaction.history.first[:date]).to match /\d\d\/\d\d\/\d\d\d\d/
    end

    it 'contains the 4 properties of a transaction instance for deposit' do
      transaction = Transaction.new
      transaction.deposit(100)
      expect(transaction.history).to eq [
        {
          date:    Date.today.strftime('%d/%m/%Y'),
          credit:  100,
          debit:   nil,
          balance: 100
        }
      ]
    end

    it 'contains the 4 properties of a transaction instance for withdraw' do
      transaction = Transaction.new
      transaction.withdraw(200)
      expect(transaction.history).to eq [
        {
          date:     Date.today.strftime('%d/%m/%Y'),
          credit:   nil,
          debit:    200,
          balance: -200
        }
      ]
    end

    it 'can hold multiple transaction events' do
      transaction = Transaction.new
      transaction.deposit(1000)
      transaction.withdraw(500)
      transaction.deposit(700)
      transaction.deposit(900)
      expect(transaction.history).to eq [
        {
          date:     Date.today.strftime('%d/%m/%Y'),
          credit:   1000,
          debit:    nil,
          balance:  1000
        },
        {
          date:     Date.today.strftime('%d/%m/%Y'),
          credit:   nil,
          debit:    500,
          balance:  500
        },
        {
          date:     Date.today.strftime('%d/%m/%Y'),
          credit:   700,
          debit:    nil,
          balance:  1200
        },
        {
          date:     Date.today.strftime('%d/%m/%Y'),
          credit:   900,
          debit:    nil,
          balance:  2100
        }
      ]
    end

  end

end
