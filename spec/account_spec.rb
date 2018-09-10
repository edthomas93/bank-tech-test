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

    it 'does not allow more than 2dp amount to be withdrawn' do
      expect{ account.deposit(100.313) }.to raise_error 'You cannot deposit a fraction of a penny. Please enter an amount up to 2 decimal places'
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

    it 'does not allow more than 2dp amount to be withdrawn' do
      expect{ account.withdraw(912.313) }.to raise_error 'You cannot withdraw a fraction of a penny. Please enter an amount up to 2 decimal places'
    end
  end

  describe '#decimals' do
    it 'identifies the number of decimal places in a number' do
      expect(decimals(0.1234)).to eq 4
      expect(decimals(0.123)).to eq 3
      expect(decimals(0.12)).to eq 2
      expect(decimals(0.1)).to eq 1
      expect(decimals(1)).to eq 0
    end
  end
end
