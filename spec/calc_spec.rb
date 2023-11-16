require_relative '../lib/calc'

RSpec.describe Calc do
  number_words = %w[zero one two three four five six seven eight nine]
  operation_words = %w[plus minus times divided_by]

  context 'digit methods' do
    number_words.each do |word, _num|
      it "responds to the #{word} method" do
        expect(Calc.new).to respond_to(word)
      end
    end
  end

  context 'operation methods' do
    operation_words.each do |operator|
      it "responds to the #{operator} method" do
        expect(Calc.new).to respond_to(operator)
      end
    end
  end

  context 'calculations' do
    it 'calculates one plus two' do
      expect(Calc.new.one.plus(2)).to eq(3)
    end

    it 'calculates five minus six' do
      expect(Calc.new.five.minus(6)).to eq(-1)
    end

    it 'calculates seven times two' do
      expect(Calc.new.seven.times(2)).to eq(14)
    end

    it 'calculates nine divided by three' do
      expect(Calc.new.nine.divided_by(3)).to eq(3)
    end

    it 'handles division by zero' do
      expect { Calc.new.one.divided_by(0) }.to raise_error(ZeroDivisionError)
    end

    it 'handles operation resulting in floating point' do
      expect(Calc.new.one.divided_by(2.0)).to eq(0.5)
    end
  end
end
