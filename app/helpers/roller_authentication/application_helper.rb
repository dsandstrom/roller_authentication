module RollerAuthentication
  module ApplicationHelper
    def current_user=(user)
      @current_user = user
    end

    def current_user
      @current_user
    end

    def authenticate
      authenticator = DummyAuthenticator.new(
        users: User.joins(:employee),
        session: session
      )

      @current_user = authenticator.authenticate
      redirect_to roller_authentication.login_url unless current_user
    end

    def authenticate_email(email)
      authenticator = DummyAuthenticator.new(
        users: User.joins(:employee),
        session: session
      )

      authenticator.authenticate_email(email)
    end

    def deauthenticate
      authenticator = DummyAuthenticator.new(
        users: User.joins(:employee),
        session: session
      )

      authenticator.deauthenticate
    end
  end
end
