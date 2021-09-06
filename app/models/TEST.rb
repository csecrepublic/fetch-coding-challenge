# require './payer.rb'
# require './transaction.rb'
# require './payer_transactions.rb'

# #TESTING PAYER
# p1 = Payer.new("Costco")
# p1.add_points(10)
# puts "Expected: 10 points\n" + p1.to_s
# p1.spend_points(5)
# puts "Expected: 5 points\n" + p1.to_s

# #TESTING TRANSACTION
# t1 = Transaction.new("Rhubarb", 20, Time.now, 3)
# puts t1

# #TESTING PAYER TRANSACTIONS
# pt1 = PayerTransactions.new

# pt1.add("Glossier", 20, Time.now)
# pt1.add("Glossier", 20, Time.now)
# pt1.add("Anthro", 50, Time.now)
# pt1.add("Madewell", 40, Time.new(2012, 10, 31))
# pt1.add("REI", 20, Time.new(2002, 10, 31))

# puts pt1

# pt1.spend(20, pt1.oldest_id)
# pt1.spend(20, pt1.oldest_id)
# pt1.spend(20, pt1.oldest_id)
# pt1.spend(20, pt1.oldest_id)


# puts pt1




# #equals ignore case for payer (change to all caps)
# #check for integer amount of money
# #all transactions know an older transaction--violating encapsulation?
# #adding negative points?
# #COMMENTS!!!
# #too many transactions => "oldest" would get backed up