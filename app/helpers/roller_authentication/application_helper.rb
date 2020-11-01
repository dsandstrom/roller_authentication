# frozen_string_literal: true

module RollerAuthentication
  module ApplicationHelper
    attr_accessor :current_user

    # TODO: test authenticate
    def authenticate
      @current_user = authenticator.authenticate
      redirect_to roller_authentication.login_url unless current_user
    end

    def user_signed_in?
      current_user.present?
    end

    def authentication_controller?
      # TODO: add || devise_controller?
      params[:controller] == 'roller_authentication/authentication'
    end

    private

      def authenticator
        @authenticator ||= DummyAuthenticator.new(
          users: RollerAuthentication.config.user_class.employees,
          session: session
        )
      end
  end
end
