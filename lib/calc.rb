class Calc
  def initialize(value = 0, pending_operation = nil)
    @value = value
    @pending_operation = pending_operation
  end

  # Operation methods return a Proc representing the operation
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

  # Digit methods
  {
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9
  }.each do |name, num|
    define_method(name) do
      if @pending_operation
        @value.send(@pending_operation, num)
      else
        Calc.new(num)
      end
    end
  end
end
