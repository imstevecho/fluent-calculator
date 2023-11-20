require_relative '../lib/calc'

RSpec.describe Calc do
  number_words = %w[zero one two three four five six seven eight nine]
  operation_words = %w[plus minus times divided_by]

  context 'method availability' do
    context 'digit methods' do
      number_words.each do |word|
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
  end

  context 'arithmetic operations' do
    it 'calculates one plus two' do
      expect(Calc.new.one.plus.two).to eq(3)
    end

    it 'calculates five minus six' do
      expect(Calc.new.five.minus.six).to eq(-1)
    end

    it 'calculates seven times two' do
      expect(Calc.new.seven.times.two).to eq(14)
    end

    it 'calculates nine divided by three' do
      expect(Calc.new.nine.divided_by.three).to eq(3)
    end
  end

  context 'special cases' do
    it 'calculates zero times any number' do
      expect(Calc.new.zero.times.five).to eq(0)
    end

    it 'calculates any number minus zero' do
      expect(Calc.new.five.minus.zero).to eq(5)
    end

    it 'handles large numbers' do
      expect(Calc.new.nine.times.nine).to eq(81)
    end

    it 'handles negative results correctly' do
      expect(Calc.new.one.minus.two).to eq(-1)
    end

    it 'correctly calculates when chaining multiple operations with digits in between' do
      expect(Calc.new.one.plus.minus.two).to eq(-1)
    end
  end

  context 'error handling' do
    it 'raises an error for undefined methods' do
      expect { Calc.new.ten }.to raise_error(NoMethodError)
    end

    it 'ensures results of division are integers' do
      expect(Calc.new.one.divided_by.two).to be_an(Integer)
    end

    it 'raises an error when dividing by zero' do
      expect { Calc.new.one.divided_by.zero }.to raise_error(RuntimeError, 'Division by zero error')
    end
  end
end
