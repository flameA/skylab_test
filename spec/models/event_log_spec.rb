# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventLog, type: :model do
  describe '#valid' do
    it 'should above add valid EventLog' do
      event = EventLog.new(event_name: 'test', timestamp: '2017-10-01 06:00:01')
      result = event.save!
      expect(result).to eq true
    end

    it 'not store event with valid params' do
      event = EventLog.new(event_name: 'test')
      result = event.save
      expect(result).to eq false
    end
  end
end
