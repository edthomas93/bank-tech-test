require 'account'

describe Account do

  describe '#balance' do
    it 'is expected to be 0 upon instantiation' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

end
