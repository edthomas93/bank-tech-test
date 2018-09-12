# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }
  let(:date) { Time.now }

  before(:each) do
    allow(Time).to receive(:now).and_return(date)
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

    it 'cannot be negative' do
      expect { account.deposit(-1) }.to raise_error 'Cannot input a negative value'
      expect(account.balance).to eq 0
    end

    it 'does not allow more than 2dp amount to be withdrawn' do
      expect { account.deposit(100.313) }.to raise_error 'Please enter an amount up to 2 decimal places'
      expect(account.balance).to eq 0
    end

    it 'must eneter numeric value' do
      expect { account.deposit('mulah') }.to raise_error 'Please enter a numeric value only'
    end
  end

  describe '#withdraw' do
    it 'decreases balance by amount withdrawn' do
      account.deposit(500)
      account.withdraw(300)
      expect(account.balance).to eq 200
    end

    it 'cannot be negative' do
      expect { account.withdraw(-1) }.to raise_error 'Cannot input a negative value'
      expect(account.balance).to eq 0
    end

    it 'does not allow more than 2dp amount to be withdrawn' do
      expect { account.withdraw(912.313) }.to raise_error 'Please enter an amount up to 2 decimal places'
      expect(account.balance).to eq 0
    end

    it 'must eneter numeric value' do
      expect { account.withdraw('money') }.to raise_error 'Please enter a numeric value only'
    end
  end
end
