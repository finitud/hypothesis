require 'hypothesis'
require 'csv'

ledger = Hypothesis::Ledger.new

%w(john mary supermarket).each do |user|
  ledger.add_user(user)
end

CSV.read('example-data.csv').each do |transaction|
  ledger.add_transaction(transaction)
end

puts ledger.balance(user: "mary")
puts ledger.balance(user: "mary", date: "2015-01-16")
