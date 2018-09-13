require 'time'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def self.create(amount, balance)
    date = Time.now.strftime('%d/%m/%Y')
    balance = format('%.2f', balance)
    if amount >= 0
      credit = format('%.2f', amount)
      debit = nil
    else
      credit = nil
      debit = format('%.2f', -amount)
    end
    Transaction.new(date, credit, debit, balance)
  end
end
