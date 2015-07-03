class Game
    attr_accessor :frames, :bonus_shots

    # Assumptions
    # Input is a comma-separated list of integers between 0 and 10.
    # Frames are in sequence.
    def initialize(args)
        @frames = []
        @bonus_shots = []
        
        marks = args.split(",").map { |x| x.to_i }
        
        i = 0
        while i < marks.length && @frames.length < 10
            shot1 = marks[i]
            i = i + 1
                
            # If it is a strike or incomplete frame
            if shot1 == 10 || i >= marks.length
                shot2 = 0
            else
                shot2 = marks[i]
                i = i + 1
            end
            frame = Frame.new shot1, shot2
                
            @frames << frame
        end
        
        # If last frame is spare, only has 1 bonus shot.
        # If last frame is strike, 2 bonus shots.
        # ignore the rest of the marks
        if @frames.length == 10
            if (@frames[9].is_spare || @frames[9].is_strike) && i < marks.length
                @bonus_shots << marks[i]
                i = i + 1
            end
            if @frames[9].is_strike && i < marks.length
                @bonus_shots << marks[i]
            end
        end
    end
    
    def get_score
        score = 0
        @frames.each_with_index do |frame, i|
            # Score of current round
            score = score + frame.get_pins
            
            # Bonus score for previous frame
            # Frame 2 to 10
            if i.between?(1, 9)
                if @frames[i - 1].is_strike
                    score = score + @frames[i].get_pins
                elsif @frames[i - 1].is_spare
                    score = score + @frames[i].shot1
                end
            end
            
            # Bonus score for previous previous frame
            # Frame 3 to 10
            if i.between?(2, 9) && @frames[i - 2].is_strike && @frames[i - 1].is_strike
                score = score + @frames[i].shot1
            end
            
            # 10th Frame
            if i == 9
                @bonus_shots.each_with_index do |bonus_shot, i|
                    score = score + bonus_shot
                    if i == 0 && frames[i - 1].is_strike && frames[i].is_strike
                        score = score + bonus_shot
                    end
                end
            end
        end
        
        score
    end
end
