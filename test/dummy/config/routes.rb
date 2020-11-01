# frozen_string_literal: true

Rails.application.routes.draw do
  mount RollerAuthentication::Engine => '/roller_authentication'

  get '/dummies' => 'dummy#index', as: :dummies
  root to: 'static#home'
end
