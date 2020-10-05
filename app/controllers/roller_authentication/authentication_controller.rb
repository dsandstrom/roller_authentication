# frozen_string_literal: true

module RollerAuthentication
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate
    before_action :set_users, only: %i[login verify]
    before_action :set_user_options, only: :login
    before_action :set_authenticator, only: %i[verify logout]

    def login
      @users = User.joins(:employee)
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

      def set_user_options
        @user_options =
          User::VALID_EMPLOYEE_TYPES.map do |type|
            [type, users_for_type(type)]
          end
      end

      def set_users
        @users = User.joins(:employee)
      end

      def set_authenticator
        @authenticator = DummyAuthenticator.new(users: @users, session: session)
      end

      def users_for_type(type)
        @users.employees(type).map { |u| [u.name_and_email, u.email] }
      end
  end
end
