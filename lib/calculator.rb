# frozen_string_literal: true

# calculator.rb
class Calculator
  OPERATORS_REGEX = %r{\s(\+|\*|/|-)\s}.freeze
  OPERATORS = ['*', '/', '+', '-'].freeze

  def initialize(equation)
    @equation = equation
  end

  def result
    operand1, operator, operand2 = equation&.split(OPERATORS_REGEX)&.map { |num| simplify_mixed_number(num) }
    # User should input operand1, legal operator and operand2, otherwise return with a message.
    return 'Incorrect Equation' if [operand1, operator, operand2].compact.size < 3 || !OPERATORS.include?(operator)

    res = case operator
          when '*'
            multiply(operand1, operand2)
          when '/'
            divide(operand1, operand2)
          when '+'
            add(operand1, operand2)
          when '-'
            subtract(operand1, operand2)
          end

    to_mixed_number(res)
  end

  private

  attr_reader :equation

  def add(num1, num2)
    num1.to_r + num2.to_r
  end

  def subtract(num1, num2)
    num1.to_r - num2.to_r
  end

  def divide(num1, num2)
    num1.to_r / num2.to_r
  end

  def multiply(num1, num2)
    num1.to_r * num2.to_r
  end

  def simplify_mixed_number(num)
    return num unless num.include?('&')

    first_num, second_num = num.split('&')
    numerator, denominator = second_num.split('/')
    "#{(first_num.to_i * denominator.to_i) + numerator.to_i}/#{denominator}"
  end

  # return res if it is a whole number or
  # mixed number if it is an improper fraction,
  def to_mixed_number(res)
    res = res.to_s
    return res unless res.include?('/')

    numerator, denominator = res.split('/').map(&:to_i)

    return numerator.to_s if denominator.to_i == 1
    return res if numerator < denominator

    first_num = numerator / denominator
    numerator = numerator % denominator
    "#{first_num}&#{numerator}/#{denominator}"
  end
end
