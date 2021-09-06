class PayerTransactions
    attr_accessor :payers, :transactions, :id, :oldest_id

    def initialize
        @payers = Hash.new
        @transactions = Hash.new
        @id = 1
        @oldest_id = 1
    end

    def add(name, pts, ts)
        unless payers.include?(name)
            p = Payer.new(name)
            payers[name] = p
        end

        payers[name].add_points(pts)
        transactions[id] = Transaction.new(name, pts, ts, oldest_id)
        
        update_oldest(ts)
        increment_id
    end

    def spend(pts, current_oldest_id)
        if transactions.empty?
            "Oops! You can't spend without adding points first."
        end

        oldest_trans = transactions[current_oldest_id]
        oldest_payer_name = oldest_trans.payer
        oldest_payer = payers[oldest_payer_name]

        if oldest_payer.points >= pts
            oldest_payer.spend_points(pts)
            puts "Spending " + pts.to_s + " points from " + oldest_payer.name
        elsif current_oldest_id == 1
            puts "Sorry, looks like you don't have enough points in your balance."
        else
            next_oldest_id = oldest_trans.older
            spend(pts, next_oldest_id)
        end
    end

    def to_s
        return_str = "\n____________ALL PAYERS____________\n"

        payers.each do |name, payer_obj|
            return_str += payer_obj.to_s + "\n\n"
        end

        return_str += "\n____________ALL TRANSACTIONS____________\n"

        transactions.each do |id, trans_obj|
            return_str += "ID: " + id.to_s + "\n"
            return_str += trans_obj.to_s + "\n\n"
        end

        return_str
    end

    
    private

    def update_oldest(ts)
        if ts < transactions[oldest_id].timestamp
            @oldest_id = id
        end
    end

    def increment_id
        @id += 1
    end
end