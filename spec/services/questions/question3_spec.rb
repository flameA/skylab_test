# frozen_string_literal: true

require 'rails_helper'

describe Questions::Question3 do
  let(:source_string) { 'abcdabcdabcdabcdeabcdcba' }
  let(:services) { described_class.new(source_string) }

  describe '#execute' do
    it 'return first no-repeat character and index' do
      result = services.execute
      expect(result.first[0]).to eq 'e'
      expect(result.first[1]).to eq 16
    end

    it 'return nil for in-valid input' do
      invalid_services = described_class.new('abcdabcdabcdabcdeabcdcbae')
      result = invalid_services.execute
      expect(result.size).to eq 0
    end
  end
end
