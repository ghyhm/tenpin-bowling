require 'spec_helper'

RSpec.describe Game do
    describe "#get_score" do
        it "get 300 score" do
            game = Game.new '10,10,10,10,10,10,10,10,10,10,10,10'
            expect(game.get_score).to eq(300)
        end
        
        it "get spare bonus" do
            game = Game.new '1,9,1,2'
            expect(game.get_score).to eq(14)
        end
        
        it "get strike bonus" do
            game = Game.new '10,1,2'
            expect(game.get_score).to eq(16)
        end
        
        it "get 2 strike bonus" do
            game = Game.new '10,10,1,2'
            expect(game.get_score).to eq(37)
        end
        
        it "2nd last and last frame strike" do
            game = Game.new '10,10,10,10,10,10,10,10,10,10,1,9'
            expect(game.get_score).to eq(281)
        end
        
        it "2nd last frame strike, last frame spare" do
            game = Game.new '10,10,10,10,10,10,10,10,10,1,9,1'
            expect(game.get_score).to eq(262)
        end
        
        it "2nd last frame strike, last frame not strike and not spare" do
            game = Game.new '10,10,10,10,10,10,10,10,10,1,2'
            expect(game.get_score).to eq(247)
        end
        
        it "half way of a frame" do
            game = Game.new '1,2,3'
            expect(game.get_score).to eq(6)
        end
        
        it "pending 2 bonus shots" do
            game = Game.new '10,10,10,10,10,10,10,10,10,10'
            expect(game.get_score).to eq(270)
        end
    
        it "pending 1 bonus shot" do
            game = Game.new '10,10,10,10,10,10,10,10,10,10,10'
            expect(game.get_score).to eq(290)
        end
    end
end
