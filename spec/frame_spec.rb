require 'spec_helper'

RSpec.describe Frame do
    describe "#is_strike" do
        it "returns false" do
          frame = Frame.new 1, 2
          expect(frame.is_strike).to eq(false)
        end
        
        it "returns true" do
            frame = Frame.new 10, 0
            expect(frame.is_strike).to eq(true)
        end
    end
    
    describe "#is_spare" do
        it "returns false" do
            frame = Frame.new 1, 2
            expect(frame.is_spare).to eq(false)
        end
        
        it "returns true" do
            frame = Frame.new 1, 9
            expect(frame.is_spare).to eq(true)
        end
    end
    
    describe "#get_pins" do
        it "returns total pins" do
            frame = Frame.new 1, 2
            expect(frame.get_pins).to eq(3)
        end
    end
end
