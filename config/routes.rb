# frozen_string_literal: true

RollerAuthentication::Engine.routes.draw do
  get '/login' => 'authentication#login', as: :login
  post '/login' => 'authentication#verify', as: :verify
  delete '/logout' => 'authentication#logout', as: :logout
end
