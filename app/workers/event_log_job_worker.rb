# frozen_string_literal: true

class EventLogJobWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(event_name, timestamp)
    event_log = EventLog.new(event_name: event_name, timestamp: timestamp.to_time)
    event_log.save!
  end
end
