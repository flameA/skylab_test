# frozen_string_literal: true

require 'rails_helper'

describe Questions::Question2 do
  let(:array1) { [3, 4, 6, 3, 7, 8, 5, 9] }
  let(:array2) { [5, 4, 1, 2, 3] }
  let(:services) { described_class.new(array1, array2) }
  describe '#execute' do
    it 'return array include elements between 2 arrays' do
      result = services.execute
      expect(result).to eq true
      expect(services.result_array).to eq [5, 4, 3]
    end

    it 'return false for in-valid input' do
      invalid_services = described_class.new([1, 2, 3, nil], 1)
      result = invalid_services.execute
      expect(result).to eq false
    end
  end
end
