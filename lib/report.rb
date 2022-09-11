require_relative 'transaction'

class Report

  def initialize(transaction)
    @transaction = transaction
  end

  attr_reader :transaction

  def format_events
    transaction.history
      .map { |event|
        "#{event[:date]} || #{event[:credit]} || #{event[:debit]}|| #{event[:balance]}\n"
    }
  end

  def report
    "date || credit || debit || balance\n" << format_events.first.to_s
  end

end

__END__
