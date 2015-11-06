module Hypothesis
  class Ledger
    attr_accessor :users
    attr_accessor :transactions

    def initialize
      @users ||= {}
      @transactions ||= []
    end

    def add_user(user_name)
      @users.merge!(user_name => 0.0)
    end

    def balance_for(user, date: nil)
      @users.fetch(user)
    end

    def add_transaction(transaction)
      @transactions << transaction
    end
  end
end
