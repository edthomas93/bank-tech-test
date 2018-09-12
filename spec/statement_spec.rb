# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:subject) { described_class.new(fake_account) }
  let(:fake_account) do
    double :fake_account, transactions: [fake_transaction, fake_transaction2]
  end
  let(:fake_transaction) { double :transaction }
  let(:fake_transaction2) { double :transaction }

  before(:each) do

    allow(fake_transaction).to receive(:date).and_return('10/06/2011')
    allow(fake_transaction).to receive(:credit).and_return('500.00')
    allow(fake_transaction).to receive(:debit).and_return(nil)
    allow(fake_transaction).to receive(:balance).and_return('500.00')

    allow(fake_transaction2).to receive(:date).and_return('21/07/2012')
    allow(fake_transaction2).to receive(:credit).and_return(nil)
    allow(fake_transaction2).to receive(:debit).and_return('225.00')
    allow(fake_transaction2).to receive(:balance).and_return('275.00')
  end

  describe '#print_statement' do
    it 'is expected to print the statement' do
      expect { subject.print_statement }.to output("date || credit || debit || balance\n21/07/2012 ||  || 225.00 || 275.00\n10/06/2011 || 500.00 ||  || 500.00\n").to_stdout
    end
  end
end
