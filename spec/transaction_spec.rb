require 'transaction'

describe Transaction do
  let(:transaction1) { Transaction.create(50, 250) }
  let(:transaction2) { Transaction.create(-50, 150) }
  let(:date) { Time.now }

  before(:each) do
    allow(Time).to receive(:now).and_return(date)
  end

  describe '#initialize' do
    it 'records the date of a transaction' do
      expect(transaction1.date). to eq date.strftime('%d/%m/%Y')
    end

    it 'records the amount as positive if credit' do
      expect(transaction1.credit). to eq '50.00'
      expect(transaction1.debit). to eq nil
    end

    it 'records the amount as negative if debit' do
      expect(transaction2.credit). to eq nil
      expect(transaction2.debit). to eq '50.00'
    end

    it 'records the updated balance' do
      expect(transaction1.balance). to eq '250.00'
    end
  end
end
