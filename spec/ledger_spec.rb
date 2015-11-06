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
end
