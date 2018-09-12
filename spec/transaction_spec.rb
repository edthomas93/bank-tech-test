# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction1) { Transaction.new(50, 'credit') }
  let(:transaction2) { Transaction.new(50, 'debit') }
  let(:date) { DateTime.now }

  before(:each) do
    allow(DateTime).to receive(:now).and_return(date)
  end

  describe '#initialize' do
    it 'records the date of a transaction' do
      expect(transaction1.date). to eq date.strftime('%d/%m/%Y')
    end

    it 'records the amount as positive if credit' do
      expect(transaction1.amount). to eq 50
    end

    it 'records the amount as negative if debit' do
      expect(transaction2.amount). to eq -50
    end
  end
end
