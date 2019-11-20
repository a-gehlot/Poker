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

        it "should return false is suits are different" do
            as = double(suit: "Diamond", value: [1, 14])
            ks = double(suit: "Spade", value: [13])
            qs = double(suit: "Spade", value: [12])
            js = double(suit: "Spade", value: [11])
            ts = double(suit: "Spade", value: [10])
            expect(hand.same_suit?([as,ks,qs,js,ts])).to be false
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

    describe "#straight_flush?" do
        it "should return true in a straight flush, with highest value" do
            as = double(suit: "Spade", value: [9])
            ks = double(suit: "Spade", value: [12])
            qs = double(suit: "Spade", value: [13])
            js = double(suit: "Spade", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.straight_flush?([as,ks,qs,js,ts])).to eq(13)
        end
    end

    describe "#royal_flush?" do
        it "should return true in a royal flush" do
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Spade", value: [12])
            qs = double(suit: "Spade", value: [13])
            js = double(suit: "Spade", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.royal_flush?([as,ks,qs,js,ts])).to be true
        end
    end

    describe "#four_of_kind?" do
        it "should return true in four of a kind hand, with highest value" do
            as = double(suit: "Spade", value: [10])
            ks = double(suit: "Heart", value: [10])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [10])
            ts = double(suit: "Spade", value: [11])
            expect(hand.four_of_kind?([as,ks,qs,js,ts])).to eq(10)
        end
    end

    describe "#full_house?" do
        it "should return true for full house, with highest value" do
            as = double(suit: "Spade", value: [10])
            ks = double(suit: "Heart", value: [10])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [11])
            ts = double(suit: "Spade", value: [11])
            expect(hand.full_house?([as,ks,qs,js,ts])).to eq(10)
        end
    end

    describe "#three_of_kind?" do
        it "should return true for three of a kind, with highest value" do
            as = double(suit: "Spade", value: [10])
            ks = double(suit: "Heart", value: [10])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [4])
            ts = double(suit: "Spade", value: [6])
            expect(hand.three_of_kind?([as,ks,qs,js,ts])).to eq(10)
        end
    end

    describe "#pair?" do
        it "should return true for a pair, with highest value" do
            as = double(suit: "Spade", value: [14,1])
            ks = double(suit: "Heart", value: [14,1])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [4])
            ts = double(suit: "Spade", value: [6]) 
            expect(hand.pair?([as,ks,qs,js,ts])).to eq(14)
        end

        it "should not be thrown off by other high-value cards" do
            as = double(suit: "Spade", value: [14,1])
            ks = double(suit: "Heart", value: [10])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [12])
            ts = double(suit: "Spade", value: [6]) 
            expect(hand.pair?([as,ks,qs,js,ts])).to eq(10)
        end
    end

    describe "#two_pair?" do
        it "should return true for two pair, with highest value" do
            as = double(suit: "Spade", value: [14,1])
            ks = double(suit: "Heart", value: [14,1])
            qs = double(suit: "Diamond", value: [10])
            js = double(suit: "Club", value: [10])
            ts = double(suit: "Spade", value: [6]) 
            expect(hand.two_pair?([as,ks,qs,js,ts])).to eq(14)
        end
    end

    describe "#high_card?" do
        it "should return true for high card, with value" do
            as = double(suit: "Spade", value: [10])
            ks = double(suit: "Heart", value: [2])
            qs = double(suit: "Diamond", value: [3])
            js = double(suit: "Club", value: [6])
            ts = double(suit: "Spade", value: [8])
            expect(hand.high_card?([as,ks,qs,js,ts])).to eq(10)
        end
    end

    describe "#straight?" do
            it "should return true for a straight, with highest value" do
            as = double(suit: "Spade", value: [10])
            ks = double(suit: "Heart", value: [9])
            qs = double(suit: "Diamond", value: [8])
            js = double(suit: "Club", value: [7])
            ts = double(suit: "Spade", value: [6])
            expect(hand.straight?([as,ks,qs,js,ts])).to eq(10)
        end

            it "should not be thrown off by ace low" do 
            as = double(suit: "Spade", value: [1, 14])
            ks = double(suit: "Heart", value: [2])
            qs = double(suit: "Diamond", value: [3])
            js = double(suit: "Club", value: [4])
            ts = double(suit: "Spade", value: [5])
            expect(hand.straight?([as,ks,qs,js,ts])).to eq(5)
        end
    end

    describe "#flush?" do
            it "should return true for a flush, with highest value" do
            as = double(suit: "Spade", value: [13])
            ks = double(suit: "Spade", value: [9])
            qs = double(suit: "Spade", value: [5])
            js = double(suit: "Spade", value: [2])
            ts = double(suit: "Spade", value: [3])
            expect(hand.flush?([as,ks,qs,js,ts])).to eq(13)
        end
    end





end