# frozen_string_literal: true

require 'rails_helper'

describe Questions::Question2 do
  let(:array1) { [3, 4, 6, 3, 7, 8, 5, 9] }
  let(:array2) { [5, 4, 1, 2, 3] }
  let(:services) { described_class.new(array1, array2) }
  describe '#execute' do
    it 'sort asc and desc for array' do
      result = [5, 4, 3]
      services.execute
      expect(services.result_array).to eq result
    end
  end
end
