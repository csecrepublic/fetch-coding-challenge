class Transaction
    attr_reader :payer, :points, :timestamp, :older
    
    def initialize(pay, pts, ts, o)
        @payer = pay
        @points = pts
        @timestamp = ts
        @older = o
    end

    def to_s
        "Payer: " + payer + "\nPoints: " + points.to_s + "\nTime: " + timestamp.to_s + "\nOldest transaction ID: " + older.to_s
    end
end