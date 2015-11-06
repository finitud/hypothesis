require 'hypothesis'

RSpec.describe Hypothesis::Ledger do

  let(:ledger) { Hypothesis::Ledger.new }

  context 'User creation' do
    describe '#add_user' do
      before do
        ledger.add_user("new user")
      end

      it 'creates a new user with a 0.0 balance and no transactions' do
        expect(ledger.users.count).to eq(1)
        expect(ledger.users).to include("new user")

        expect(ledger.users["new user"].count).to eq(0)
        expect(ledger.balance_for("new user")).to eq(0.0)
      end
    end
  end

  context 'Transaction management' do
    before do
      ledger.add_user("alice")
      ledger.add_user("bob")
      ledger.add_transaction("2015-01-16", "alice", "bob", "10.00")
    end

    describe '#add_transaction' do
      it 'adds a new transaction to the ledger' do
        expect(ledger.transactions.count).to eq(1)
      end

      it 'adds a new transaction to each of the two counterparties' do
        expect(ledger.users["alice"].count).to eq(1)
        expect(ledger.users["bob"].count).to eq(1)
      end

      it 'updates user balances' do
        expect(ledger.balance_for("alice")).to eq(-10.0)
        expect(ledger.balance_for("bob")).to eq(10.0)
      end
    end

  end

end
