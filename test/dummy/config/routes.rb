# frozen_string_literal: true

Rails.application.routes.draw do
  mount RollerAuthentication::Engine => '/roller_authentication'

  root to: 'static#home'
end
