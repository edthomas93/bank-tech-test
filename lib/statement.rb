class Statement
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
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
