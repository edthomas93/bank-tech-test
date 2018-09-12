# frozen_string_literal: true

require 'time'
require_relative 'transaction'

class Account
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    error_message(amount)
    @balance += amount
    @transactions.push(Transaction.new(amount, @balance))
  end

  def withdraw(amount)
    error_message(amount)
    @balance -= amount
    @transactions.push(Transaction.new(-amount, @balance))
  end
end

private

def error_message(value)
  raise 'Please enter a numeric value only' unless value.is_a? Numeric
  raise 'Please enter an amount up to 2 decimal places' if value * 100 != (value * 100).to_i
  raise 'Cannot input a negative value' if value.negative?
end
