# Fluent Calculator Implementation

## Description
The Fluent Calculator Kata is inspired by the "Calculating with Functions Kata for JavaScript" on codewars. The goal is to implement a simple calculator which uses fluent syntax:

Examples:
1. `Calc.new.one.plus.two` (result: 3)
2. `Calc.new.five.minus.six` (result: -1)
3. `Calc.new.seven.times.two` (result: 14)
4. `Calc.new.nine.divided_by.three` (result: 3)

### Supported Operations and Digits
- Operations: plus, minus, times, divided_by
- Digits: zero, one, two, three, four, five, six, seven, eight, nine

Each calculation consists of one operation only and will return an integer.

**Note:** This is not a string parsing problem. The calls above are a chain of methods. Some languages may require parenthesis in method calls. That is OK, but consider a different language that would support the above syntax if possible.
