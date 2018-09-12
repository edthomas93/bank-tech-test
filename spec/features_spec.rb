# frozen_string_literal: true

require 'statement'

# As a customer,
# To increase the balance in my account,
# I want to be able to make deposits.

describe 'user can deposit money to increase their balance' do
  it 'increass balance by amount deposited' do
    account = Account.new
    expect(account.balance).to eq 0
    account.deposit(1000.54)
    expect(account.balance).to eq 1000.54
  end
end

# As a customer,
# To access the money I have deposited,
# I want to be able to make withdrawals.

describe 'user can withdraw money that they have deposited' do
  it 'decreass balance by amount withdrawn' do
    account = Account.new
    expect(account.balance).to eq 0
    account.deposit(10000)
    expect(account.balance).to eq 10000
    account.withdraw(30.21)
    expect(account.balance).to eq 9969.79
  end
end

# As a customer,
# To be able to monitor my spending,
# I want to be able to view my bank statement.

# describe 'user can view their transaction history' do
#   let(:date) { Time.now }
#   before(:each) do
#     allow(Time).to receive(:now).and_return(date)
#   end
#
#   it 'by viewing a statement in the command line' do
#     account = Account.new
#     statement = Statement.new(account)
#     account.deposit(800)
#     account.withdraw(200)
#     expect { statement.print_statement }.to output("date || credit || debit || balance\n#{date.strftime('%d/%m/%Y')} ||  || 200.00 || 600.00\n#{date.strftime('%d/%m/%Y')} || 800.00 ||  || 800.00\n").to_stdout
#   end
# end
