# frozen_string_literal: true

module RollerAuthentication
  class AuthenticationController < ApplicationController
    before_action :set_options, only: :login

    def login
      @users = User.joins(:employee)
    end

    def verify
      if authenticate_email(params[:current_user])
        redirect_to main_app.root_url, notice: 'Login was successful'
      else
        redirect_to roller_authentication.login_url, alert: 'Login failed'
      end
    end

    def logout
      deauthenticate
      redirect_to roller_authentication.login_url, notice: 'Logged out successfully'
    end

    private

      def set_options
        @options =
          User::VALID_EMPLOYEE_TYPES.map do |type|
            [type, User.employees(type).map { |u| [u.name_and_email, u.email] }]
          end
      end
  end
end
