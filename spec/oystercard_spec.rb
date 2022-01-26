require './lib/oystercard.rb'

describe Oystercard do
    let(:oystercard) { Oystercard.new }

    it '#\'s initializes to 0' do
        expect(oystercard.balance).to eq 0
    end

    it '#can be topped up' do
        oystercard.top_up(15)
        expect(oystercard.balance).to eq 15
    end

    it '#has a max limit of 90' do
        expect{ oystercard.top_up(91) }.to raise_error "#{oystercard.balance} cannot exceed £90"
    end

    it "can deduct balance" do
        subject.top_up(50)
        expect{subject.deduct 1}.to change{subject.balance}.by -1
    end 

    it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
    end

    it "can touch in" do
        subject.touch_in
        expect(subject).to be_in_journey
    end

    it "can touch out" do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
      
end