require_relative 'account'

class Statement
  def initialize(account = Account.new)
    @account = account
  end

  def print_statement
    puts "date || credit || debit || balance"
    @account.transactions.reverse.each do | transaction |
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

end
