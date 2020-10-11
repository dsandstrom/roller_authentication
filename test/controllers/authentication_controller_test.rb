# frozen_string_literal: true

require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    RollerAuthentication.config.user_class = User
  end

  # main_app.root_url doesn't work, still uses mount path
  def root_url
    @root_url ||= 'http://www.example.com/'
  end

  test 'should get login for a guest' do
    get roller_authentication.login_url
    assert_response :success
  end

  test 'should post to verify with valid params' do
    user = User.new
    User.stub(:find_by_email, user) do
      post roller_authentication.verify_url, params: { current_user: 'email' }
      assert_redirected_to root_url
    end
  end

  test 'should post to verify with invalid params' do
    User.stub(:find_by_email, nil) do
      post roller_authentication.verify_url, params: { current_user: 'email' }
      assert_redirected_to roller_authentication.login_url
    end
  end

  test 'delete to logout' do
    delete roller_authentication.logout_url
    assert_redirected_to roller_authentication.login_url
  end
end
