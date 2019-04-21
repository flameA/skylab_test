# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe EventLogController, type: :controller do
  describe 'Post #create_event' do
    it 'should not able create success event' do
      post :create_event
      result = JSON.parse(response.body)
      expect(result['success']).to eq false
    end
  end
end
