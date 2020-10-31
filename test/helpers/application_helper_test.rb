# frozen_string_literal: true

require 'test_helper'

module RollerAuthentication
  class ApplicationHelperTest < ActionView::TestCase
    test '#authentication_controller? when AuthenticationController' do
      controller.params[:controller] = 'roller_authentication/authentication'
      assert_equal true, controller.authentication_controller?
    end

    test '#authentication_controller? when another AuthenticationController' do
      controller.params[:controller] = 'authentication'
      assert_equal false, controller.authentication_controller?
    end

    test '#authentication_controller? when not AuthenticationController' do
      controller.params[:controller] = 'users'
      assert_equal false, controller.authentication_controller?
    end

    test '#user_signed_in? when current_user' do
      controller.current_user = User.new
      assert_equal true, controller.user_signed_in?
    end

    test '#user_signed_in? when no current_user' do
      controller.current_user = nil
      assert_equal false, controller.user_signed_in?
    end
  end
end
