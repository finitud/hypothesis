require 'hypothesis'

RSpec.describe Hypothesis::Ledger do
  context 'implements the chosen interface' do
    let(:ledger) { Hypothesis::Ledger.new }

    it '#add_user creates a new user with a 0.0 balance' do
      ledger.add_user("new user")
      expect(ledger.balance_for("new user")).to eq(0.0)
    end
  end
end
