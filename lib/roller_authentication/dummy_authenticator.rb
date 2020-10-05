# frozen_string_literal: true

module RollerAuthentication
  class DummyAuthenticator
    SESSION_KEY = :current_user

    attr_accessor :users, :session

    def initialize(args)
      self.users = args[:users]
      self.session = args[:session]
    end

    def authenticate
      cookie = session[SESSION_KEY]
      user = users.find_by_email(cookie) if cookie
      user || false
    end

    def deauthenticate
      session.delete SESSION_KEY
    end

    def authenticate_email(email)
      user = users.find_by_email(email)
      return false unless user

      session[SESSION_KEY] = user.email
      true
    end
  end
end
