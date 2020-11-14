# frozen_string_literal: true

module RollerAuthentication
  class AuthenticationController < ApplicationController
    before_action :set_users, only: %i[login verify]
    before_action :set_user_options, only: :login
    before_action :set_authenticator

    def login
      return unless @authenticator&.authenticate

      redirect_to main_app.root_url, alert: 'Already logged in.'
    end

    def verify
      if @authenticator.authenticate_email(params[:current_user])
        redirect_to main_app.root_url, notice: 'Logged in successfully.'
      else
        redirect_to roller_authentication.login_url, alert: 'Login failed.'
      end
    end

    def logout
      @authenticator.deauthenticate
      redirect_to roller_authentication.login_url,
                  notice: 'Logged out successfully.'
    end

    private

      def authenticate
        # skip_before_action :authenticate
      end

      def set_users
        @users = RollerAuthentication.config.user_class.employees
      end

      def set_user_options
        @user_options =
          User::VALID_EMPLOYEE_TYPES.reverse.map do |type|
            [type, users_for_type(type)]
          end
      end

      def set_authenticator
        @authenticator = DummyAuthenticator.new(users: @users, session: session)
      end

      def users_for_type(type)
        RollerAuthentication
          .config.user_class
          .employees(type).map { |u| [u.name_and_email, u.email] }
      end
  end
end
