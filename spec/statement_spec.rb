require 'statement'

describe Statement do
  let(:subject) { described_class.new(fake_account) }
  let(:fake_account) do
    double :fake_account, transactions: [
      { date: '10/06/2011', credit: '500.00', debit: nil, balance: '500.00' },
      { date: '21/07/2012', credit: nil, debit: '225.00', balance: '275.00' }
    ]
  end

  describe '#print_statement' do
    it 'is expected to print the statement' do
      expect { subject.print_statement }.to output("date || credit || debit || balance\n21/07/2012 ||  || 225.00 || 275.00\n10/06/2011 || 500.00 ||  || 500.00\n").to_stdout
    end
  end
end
