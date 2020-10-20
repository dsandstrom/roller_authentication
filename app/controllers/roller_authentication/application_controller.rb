# frozen_string_literal: true

module RollerAuthentication
  class ApplicationController < ActionController::Base
    include ApplicationHelper

    protect_from_forgery with: :exception

    layout 'layouts/application'
  end
end
