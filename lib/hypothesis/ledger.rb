module Hypothesis
  class Ledger
    attr_accessor :users
    attr_accessor :transactions

    UserTransaction = Struct.new(:date, :counterparty, :amount)

    def initialize
      @users ||= {}
      @transactions ||= []
    end

    def add_user(user_name)
      @users.merge!(user_name => [])
    end

    def balance_for(user, date: nil)
      running_total = 0.0
      @users.fetch(user).each do |t|
        running_total += t.amount
      end
      running_total
    end

    def add_transaction(date, user, counterparty, amount)
      @transactions << [date, user, counterparty, amount]
      @users[user] << UserTransaction.new(date, counterparty, -amount.to_f)
      @users[counterparty] << UserTransaction.new(date, user, amount.to_f)
    end
  end
end
