# frozen_string_literal: true

Rails.application.routes.draw do
  get 'question1/answer', to: 'home#question1'
  get 'question2/answer', to: 'home#question2'
  get 'question3/answer', to: 'home#question3'
  get 'question4/answer', to: 'home#question4'
  get 'question5/answer', to: 'home#question5'
  get 'question6/answer', to: 'home#question6'

  root to: 'home#question1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
