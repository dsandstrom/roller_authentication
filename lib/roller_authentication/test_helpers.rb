# frozen_string_literal: true

module RollerAuthentication
  module TestHelpers
    def login(user)
      session[:current_user] = user.email
    end

    def logout
      session.delete :current_user
    end
  end
end
