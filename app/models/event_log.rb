# frozen_string_literal: true

class EventLog < ApplicationRecord
  validates :event_name, presence: true
  validates :timestamp, presence: true
end
