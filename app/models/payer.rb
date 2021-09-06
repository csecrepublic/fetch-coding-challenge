class Payer
    attr_accessor :name, :points

    def initialize(n)
        @name = n
        @points = 0
    end

    def add_points(pts)
        @points += pts
    end

    def spend_points(pts)
        @points -= pts
    end

    def to_s
        "Payer: " + name + "\nPoints: " + points.to_s
    end
end

