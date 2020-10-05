require "test_helper"

class DummyAuthenticatorTest < ActiveSupport::TestCase
  def authenticator
    @authenticator ||=
      RollerAuthentication::DummyAuthenticator.new(users: [], session: {})
  end

  test "#initiailize users" do
    assert_equal [], authenticator.users
  end

  test "#initiailize session" do
    assert_equal({}, authenticator.session)
  end

  test "#authenticate when current_user in session" do
    user = User.new

    User.stub(:find_by_email, user) do
      authenticator.users = User
      authenticator.session = { current_user: "test" }
      assert_equal user, authenticator.authenticate
    end
  end

  test "#authenticate when current_user session nil" do
    user = User.new

    User.stub(:find_by_email, user) do
      authenticator.users = User
      authenticator.session = { current_user: nil }
      assert_equal false, authenticator.authenticate
    end
  end

  test "#authenticate when current_user not found" do
    User.stub(:find_by_email, nil) do
      authenticator.users = User
      authenticator.session = { current_user: "test" }
      assert_equal false, authenticator.authenticate
    end
  end

  test "#deauthenticate when cookie set" do
    session = { current_user: "test" }
    authenticator.session = session

    assert_changes session, to: {} do
      authenticator.deauthenticate
    end
  end

  test "#authenticate_email when current_user found" do
    user = User.new
    user.email = "email"
    session = {}

    User.stub(:find_by_email, user) do
      authenticator.users = User
      authenticator.session = session
      assert_equal true, authenticator.authenticate_email("email")
      assert_equal({ current_user: "email" }, session)
    end
  end

  test "#authenticate_email when current_user not found" do
    session = {}

    User.stub(:find_by_email, nil) do
      authenticator.users = User
      authenticator.session = session
      assert_equal false, authenticator.authenticate_email("email")
      assert_equal({}, session)
    end
  end
end
