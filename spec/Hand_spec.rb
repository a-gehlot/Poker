require "hand.rb"
require "rspec"

describe "Hand" do

    subject(:hand) { Hand.new }

    describe "#same_suit?" do
        it "should return true if suits in a hand are the same" do
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Spade", value: [13])
            qs = double(suit: "Spade", value: [12])
            js = double(suit: "Spade", value: [11])
            ts = double(suit: "Spade", value: [10])
            expect(hand.same_suit?([as,ks,qs,js,ts])).to be true
        end
    end

    describe "#in_order?" do
        it "should return true if cards are straight" do
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Spade", value: [13])
            qs = double(suit: "Spade", value: [12])
            js = double(suit: "Spade", value: [11])
            ts = double(suit: "Spade", value: [10])
            expect(hand.in_order?([as,ks,qs,js,ts])).to be true
        end

        it "should return true even if cards aren't entered in order" do
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Spade", value: [12])
            qs = double(suit: "Spade", value: [13])
            js = double(suit: "Spade", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.in_order?([as,ks,qs,js,ts])).to be true
        end

        it "should return false if cards are not straight" do
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Spade", value: [12])
            qs = double(suit: "Spade", value: [8])
            js = double(suit: "Spade", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.in_order?([as,ks,qs,js,ts])).to be false
        end

        it "should work with aces as well as non-aces" do
            as = double(suit: "Spade", value: [5])
            ks = double(suit: "Spade", value: [12])
            qs = double(suit: "Spade", value: [9])
            js = double(suit: "Spade", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.in_order?([ks,qs,js,ts])).to be true
            expect(hand.in_order?([as,ks,qs,js,ts])).to be false
        end
    end

end