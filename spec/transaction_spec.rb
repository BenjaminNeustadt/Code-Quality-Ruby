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

  end

end