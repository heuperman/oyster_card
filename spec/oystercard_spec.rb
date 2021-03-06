require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'Starts with a balance of zero' do
      expect(Oystercard.new.balance).to eq(0)
    end
  end

  describe '#top_up()' do
    it 'Tops up the balance with method argument' do
      expect{subject.top_up 10}. to change{subject.balance}.by 10
    end

    it 'Raises an error if limit is exceeded' do
      max = Oystercard::MAX_BALANCE
      subject.top_up(max)
      expect{subject.top_up(1)}.to raise_error("Maximum limit of #{max} exceeded.")
    end

    describe '#deduct()' do
      it 'Deduct the balance with method argument' do
        expect{subject.deduct(10)}. to change{subject.balance}.by(-10)
      end
    end

    describe '#touch_in' do
      it 'Changes in_journey to true' do
        subject.touch_in
        expect(subject.in_journey?).to eq true
      end
    end

    describe '#touch_out' do
      it 'Changes in_journey to false' do
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end
    end

    describe '#in_journey?' do
      it 'Returns true or false' do
        expect(subject.in_journey?).to eq(true).or eq(false)
      end
    end
  end
end
