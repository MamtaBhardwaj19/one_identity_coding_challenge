# frozen_string_literal: true

require 'spec_helper'
require './lib/calculator'

describe 'Calculator' do
  context 'Given correct input' do
    it 'can add the operands' do
      expect(Calculator.new('2&3/8 + 9/8').result).to eq '3&1/2'
    end

    it 'can subtract the operands' do
      expect(Calculator.new('1&3/4 - 2').result).to eq '-1/4'
    end

    it 'can multiply the operands' do
      expect(Calculator.new('1/2 * 3&3/4').result).to eq '1&7/8'
    end

    it 'can divide the operands' do
      expect(Calculator.new('1/2 / 3&3/4').result).to eq '2/15'
    end
  end

  context 'Given incorrect input' do
    it 'should return Incorrect Equation as message if number of operands are not 2' do
      expect(Calculator.new('1/2 + ').result).to eq 'Incorrect Equation'
    end

    it 'should return Incorrect Equation as message if legal operator is not passed' do
      expect(Calculator.new('1/2 # 3&3/4').result).to eq 'Incorrect Equation'
    end
  end
end
