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
    if decimals(amount) > 2
      raise "You cannot deposit a fraction of a penny. Please enter an amount up to 2 decimal places"
    elsif amount < 0
      raise "Cannot deposit a negative value"
    else
      @balance += amount
      @transactions.push(date: date_of_transaction, credit: format('%.2f', amount), debit: nil, balance: format('%.2f', @balance))
    end
  end

  def withdraw(amount)
    if decimals(amount) > 2
      raise "You cannot withdraw a fraction of a penny. Please enter an amount up to 2 decimal places"
    elsif amount < 0
      raise "Cannot withdraw a negative value"
    else
      @balance -= amount
      @transactions.push(date: date_of_transaction, credit: nil, debit: format('%.2f', amount), balance: format('%.2f', @balance))
    end
  end
end

private

def decimals(number)
    dp = 0
    while(number != number.to_i)
        dp += 1
        number *= 10
    end
    dp
end
