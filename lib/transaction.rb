require 'time'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(amount, balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @balance = format('%.2f', balance)
    if amount >= 0
      @credit = format('%.2f', amount)
      @debit = nil
    else
      @credit = nil
      @debit = format('%.2f', -amount)
    end
  end
end
