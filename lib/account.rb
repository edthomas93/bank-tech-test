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
    t.strftime("%d/%m/%Y")
  end

  def deposit(amount)
    @balance += amount
    @transactions.push({ date: date_of_transaction,credit: amount, debit: nil, balance: @balance })
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push({ date: date_of_transaction,credit: nil, debit: amount, balance: @balance })
  end
end
