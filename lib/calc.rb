class Calc
  def initialize(value = 0, operation = nil)
    @value = value
    @operation = operation
  end

  # Defines operation methods
  {
    plus: :+,
    minus: :-,
    times: :*,
    divided_by: :/
  }.each do |method, operator|
    define_method(method) do
      Calc.new(@value, operator)
    end
  end

  # Defines digit methods
  {
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9
  }.each do |name, num|
    define_method(name) do
      if @operation
        raise 'Division by zero error' if @operation == :/ && num == 0

        @value.send(@operation, num)
      else
        Calc.new(num)
      end
    end
  end
end
