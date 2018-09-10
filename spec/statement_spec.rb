require 'statement'

describe Statement do
  before(:each) do
    stub_date = '10/09/2018'
    allow(DateTime).to receive(:now).and_return(stub_date)
  end

  # let(:subject) { described_class.new(fake_account) }
  # let(:fake_account) { double :account, account: [
  #   {date: 10/06/2011, credit: 500, debit: nil, balance: 500},
  #   {date: 21/07/2012, credit: nil, debit: 225, balance: 275}
  #   ] }

  describe '#print_statement' do
    it 'is expected to print the statement' do
      account = Account.new
      statement = Statement.new(account)
      account.deposit(500)
      account.withdraw(225)
      expect { statement.print_statement }.to output("date || credit || debit || balance\n10/09/2018 ||  || 225 || 275\n10/09/2018 || 500 ||  || 500\n").to_stdout
    end
  end
end
