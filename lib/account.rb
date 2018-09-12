require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

  OVERDRAFT = 1000

  def initialize(statement = Statement.new)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    error_message(amount)
    @balance += amount
    @transactions.push(Transaction.new(amount, @balance))
  end

  def withdraw(amount)
    error_message(amount)
    raise "#{OVERDRAFT} is overdraft capacity" if amount > @balance + OVERDRAFT
    @balance -= amount
    @transactions.push(Transaction.new(-amount, @balance))
  end

  def print_statement
    @statement.print_statement(@transactions)
  end
end

private

def error_message(value)
  raise 'Please enter a numeric value only' unless value.is_a? Numeric
  raise 'Please enter an amount up to 2 decimal places' if value * 100 != (value * 100).to_i
  raise 'Cannot input a negative value' if value.negative?
end
