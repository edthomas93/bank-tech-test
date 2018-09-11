# frozen_string_literal: true

require 'time'

class Account
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def date_of_transaction
    date = DateTime.now
    date.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    error_message(amount)
    @balance += amount
    @transactions.push(date: date_of_transaction, credit: format('%.2f', amount), debit: nil, balance: format('%.2f', @balance))
  end

  def withdraw(amount)
    error_message(amount)
    @balance -= amount
    @transactions.push(date: date_of_transaction, credit: nil, debit: format('%.2f', amount), balance: format('%.2f', @balance))
  end
end

def error_message(value)
  if !value.is_a? Numeric
    raise 'Please enter a numeric value only'
  elsif value * 100 != (value * 100).to_i
    raise 'Please enter an amount up to 2 decimal places'
  elsif value < 0
    raise 'Cannot input a negative value'
  end
end
