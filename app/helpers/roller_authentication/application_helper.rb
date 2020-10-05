# frozen_string_literal: true

module RollerAuthentication
  module ApplicationHelper
    attr_accessor :current_user

    def authenticate
      authenticator = DummyAuthenticator.new(
        users: RollerAuthentication.config.users,
        session: session
      )

      @current_user = authenticator.authenticate
      redirect_to roller_authentication.login_url unless current_user
    end
  end
end
