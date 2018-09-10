require 'account'

describe Account do
  let(:account) { Account.new }

  before(:each) do
    stub_date = '10/09/2018'
    allow(DateTime).to receive(:now).and_return(stub_date)
  end

  it 'is expected to respond to balance' do
    expect(subject).to respond_to :balance
  end

  it 'is expected to respond to transactions' do
    expect(subject).to respond_to :transactions
  end

  describe '#balance' do
    it 'is expected to be 0 upon instantiation' do
      expect(account.balance).to eq 0
    end
  end

  describe '#transacations' do
    it 'is an empty array on instantiation' do
      expect(account.transactions).to eq []
    end
  end

  describe '#deposit' do
    it 'increass balance by amount deposited' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'stores a hash in transactions with credit as a float and debit as nil' do
      account.deposit(500)
      expect(account.transactions).to eq [{ date: '10/09/2018', credit: '500.00', debit: nil, balance: '500.00' }]
    end

    it 'cannot be negative' do
      expect{ account.deposit(-1) }.to raise_error 'Cannot deposit a negative value'
    end
  end

  describe '#withdraw' do
    it 'decreases balance by amount withdrawn' do
      account.deposit(500)
      account.withdraw(300)
      expect(account.balance).to eq 200
    end

    it 'stores a hash in transactions with debit as a float and credit as nil' do
      account.withdraw(500)
      expect(account.transactions).to eq [{ date: '10/09/2018', credit: nil, debit: '500.00', balance: '-500.00' }]
    end

    it 'cannot be negative' do
      expect{ account.withdraw(-1) }.to raise_error 'Cannot withdraw a negative value'
    end
  end
end
