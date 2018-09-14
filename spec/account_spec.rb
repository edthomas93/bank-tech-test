require 'account'

describe Account do
  let(:account) { Account.new(fake_statement) }
  let(:fake_statement) { double :statement }

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
      account.withdraw(300)
      expect(account.balance).to eq(-300)
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

    it 'does not let you withdraw beyond the overdraft limit' do
      expect { account.withdraw(Account::OVERDRAFT + 0.01) }.to raise_error "#{Account::OVERDRAFT} is overdraft capacity"
    end
  end

  describe '#print_statement' do
    it 'decreases balance by amount withdrawn' do
      expect(fake_statement).to receive(:print_statement)
      account.print_statement
    end
  end
end
