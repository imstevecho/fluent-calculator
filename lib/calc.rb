class Calc
  def initialize(value = 0)
    @value = value
  end

  # Operation methods are now defined to take a number and return the result
  {
    plus: :+,
    minus: :-,
    times: :*,
    divided_by: :/
  }.each do |method, operator|
    define_method(method) do |num|
      @value.send(operator, num)
    end
  end

  # Digit methods
  {
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9
  }.each do |name, num|
    define_method(name) do
      if @value == 0
        Calc.new(num)
      else
        @value
      end
    end
  end
end
