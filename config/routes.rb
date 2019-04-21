# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#question1'
  get 'question1/answer', to: 'home#question1'
  get 'question2/answer', to: 'home#question2'
  get 'question3/answer', to: 'home#question3'
  get 'question4/answer', to: 'home#question4'
  get 'question5/answer', to: 'home#question5'

  post 'api/event_logs', to: 'event_log#create_event'
  resources :event_log, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
