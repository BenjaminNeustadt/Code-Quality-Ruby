class Report

  private

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

  public

  def to_s
    heading = ["date || credit || debit || balance"]
    heading << format_events
    heading.join("\n") << "\n"
  end

end
