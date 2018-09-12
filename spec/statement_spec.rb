require 'statement'

describe Statement do
  let(:fake_transaction) { double :transaction }
  let(:fake_transaction2) { double :transaction }

  before(:each) do
    build_fake_transaction(fake_transaction, '10/06/2011', '500.00', nil, '500.00')
    build_fake_transaction(fake_transaction2, '21/07/2012', nil, '225.00', '275.00')
  end

  describe '#print_statement' do
    it 'is expected to print the statement' do
      transactions = [fake_transaction, fake_transaction2]
      expect { subject.print_statement(transactions) }.to output("date || credit || debit || balance\n21/07/2012 ||  || 225.00 || 275.00\n10/06/2011 || 500.00 ||  || 500.00\n").to_stdout
    end
  end
end
