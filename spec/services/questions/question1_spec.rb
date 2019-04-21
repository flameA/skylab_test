# frozen_string_literal: true

require 'rails_helper'

describe Questions::Question1 do
  let(:array) { [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13] }
  let(:services) { described_class.new(array) }
  describe '#execute' do
    it 'create sucess asc array and desc array' do
      asc_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13]
      desc_array = [13, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
      result = services.execute
      expect(result).to eq true
      expect(services.asc_array).to eq asc_array
      expect(services.desc_array).to eq desc_array
    end

    it 'return false with invalid input' do
      invalid_service = described_class.new([nil, -1, 'a', 1, 2])
      result = invalid_service.execute
      expect(result).to eq false
    end
  end
end
