# frozen_string_literal: true

require 'time'

class Transaction
  attr_reader :date, :amount

  def initialize(amount, type)
    @date = DateTime.now.strftime('%d/%m/%Y')
    @amount = amount if type == 'credit'
    @amount = -amount if type == 'debit'
  end
end
