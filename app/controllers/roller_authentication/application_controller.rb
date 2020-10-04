module RollerAuthentication
  class ApplicationController < ActionController::Base
    include ApplicationHelper

    protect_from_forgery with: :exception
  end
end
