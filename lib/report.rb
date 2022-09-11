class Report

  def initialize(transaction)
    @transaction = transaction
  end

  attr_reader :transaction

  def format_events
    transaction.history
      .reverse
      .map { |event|
         "#{event[:date]} || #{event[:credit]} || #{event[:debit]} || #{event[:balance]}"
    }
  end

  def report
    heading = ["date || credit || debit || balance"]
    heading << format_events
    heading.join("\n") << "\n"
  end

end
