require 'hypothesis'

RSpec.describe Hypothesis::Ledger do

  let(:ledger) { Hypothesis::Ledger.new }

  context 'User creation' do
    describe '#add_user' do
      it 'creates a new user with a 0.0 balance' do
        expect do
          ledger.add_user("new user")
        end.to change { ledger.users.count }.by(1)

        expect(ledger.users).to include("new user")
        expect(ledger.balance_for("new user")).to eq(0.0)
      end
    end
  end

  context 'Transaction management' do
    before do
      ledger.add_user("alice")
      ledger.add_user("bob")
    end

    describe '#add_transaction' do
      it 'adds a new transaction to the ledger' do
        transaction = [ "2015-01-16", "alice", "bob", "10.00" ]

        expect do
          ledger.add_transaction(transaction)
        end.to change { ledger.transactions.count }.by(1)
      end
  end

end
