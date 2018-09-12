require_relative 'account'

class Statement
  def initialize(account)
    @account = account
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @account.transactions.reverse.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end

private

def build_fake_transaction(name, date, credit, debit, balance)
  allow(name).to receive(:date).and_return(date)
  allow(name).to receive(:credit).and_return(credit)
  allow(name).to receive(:debit).and_return(debit)
  allow(name).to receive(:balance).and_return(balance)
end
