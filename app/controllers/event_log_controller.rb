# frozen_string_literal: true

class EventLogController < ApplicationController
  protect_from_forgery with: :null_session, only: :create_event

  def index
    @event_logs = EventLog.last(1_000)
  end

  def create_event
    if event_params[:event_name].nil? || event_params[:timestamp].nil?
      render json: { success: false, errors: 'Params is invalid' }
    else
      EventLogJobWorker.perform_async(event_params[:event_name], event_params[:timestamp])
      render json: { success: true }
    end
  end

  private

  def event_params
    @event_params ||= params.permit(:event_name, :timestamp).tap do |p|
      p[:event_name] = p[:event_name].strip if p[:event_name]
      p[:timestamp] = p[:timestamp].strip if p[:timestamp]
    end
  end
end
