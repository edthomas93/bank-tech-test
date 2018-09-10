require 'time'

class Account
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def date_of_transaction
    t = Time.now
    t.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    if amount >= 0
      @balance += amount
      @transactions.push(date: date_of_transaction, credit: format('%.2f', amount), debit: nil, balance: format('%.2f', @balance))
    else
      raise "Cannot deposit a negative value"
    end
  end

  def withdraw(amount)
    if amount >= 0
      @balance -= amount
      @transactions.push(date: date_of_transaction, credit: nil, debit: format('%.2f', amount), balance: format('%.2f', @balance))
    else
      raise "Cannot withdraw a negative value"
    end
  end
end
