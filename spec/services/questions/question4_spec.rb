# frozen_string_literal: true

require 'rails_helper'

describe Questions::Question4 do
  let(:source_string) { 'zyabcdabcac' }
  let(:services) { described_class.new(source_string) }

  describe '#execute' do
    it 'return array count the number of the character in a String' do
      services.execute
      input1 = { a: 3, c: 3, b: 2, d: 1, y: 1, z: 1 }.to_s
      input2 = { z: 1, y: 1, d: 1, b: 2, c: 3, a: 3 }.to_s
      expect(services.output1.to_s).to eq input1
      expect(services.output2.to_s).to eq input2
    end

    it 'return nil for in-valid input' do
      invalid_services = described_class.new(123)
      result = invalid_services.execute
      expect(result).to eq false
    end
  end
end
