require 'test_helper'

class DummyAuthenticatorTest < ActiveSupport::TestCase
  test "assigns users" do
    authenticator = RollerAuthentication::DummyAuthenticator.new(users: [], session: {})
    assert_equal [], authenticator.users
  end

  test "assigns session" do
    authenticator = RollerAuthentication::DummyAuthenticator.new(users: [], session: {})
    assert_equal({}, authenticator.session)
  end
end
