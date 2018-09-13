class Statement
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
