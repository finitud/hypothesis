module Hypothesis
  class Ledger
    def initialize
      @users ||= {}
    end

    def add_user(user_name)
      @users.merge!(user_name => 0.0)
    end

    def balance_for(user, date: nil)
      @users.fetch(user)
    end
  end
end
