# frozen_string_literal: true

require 'test_helper'

module RollerAuthentication
  class DummyControllerTest < ActionDispatch::IntegrationTest
    setup do
      RollerAuthentication.config.user_class = User
      Rails.application.config.session_store :cookie_store,
                                             key: '_your_app_session'
    end

    test '#index when no user in session' do
      get main_app.dummies_path
      assert_redirected_to roller_authentication.login_url
    end

    # can't set session
    # test '#index when valid user in session' do
    #   user = User.new(email: 'email')
    #
    #   session[:current_user] = user.email
    #   User.stub(:find_by_email, user) do
    #     get main_app.dummies_path
    #
    #     assert_equal user, controller.current_user
    #     assert_response :success
    #   end
    # end
  end
end
