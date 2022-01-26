class Oystercard

    attr_reader :balance

    def initialize(balance = 0)
        @balance = balance
        @in_journey = false
    end

    def top_up(money)
        fail "#{@balance} cannot exceed £90" if (money + @balance) >= 90
        @balance += money
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
       @in_journey
    end

    def touch_in
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end
end