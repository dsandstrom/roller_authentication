require "roller_authentication/engine"
require "roller_authentication/dummy_authenticator"

module RollerAuthentication
end

ActiveSupport.on_load(:action_controller_base) do
  prepend RollerAuthentication::ApplicationHelper
  helper_method :current_user
  before_action :authenticate
end
