class Frame
    attr_accessor :shot1, :shot2
    
    def initialize(shot1, shot2)
        @shot1 = shot1
        @shot2 = shot2
    end
    
    def get_pins
        @shot1 + @shot2
    end
    
    def is_strike
        if @shot1 == 10
            true
        else
            false
        end
    end
    
    def is_spare
        if shot2 != 0 && get_pins == 10
            true
        else
            false
        end
    end
end