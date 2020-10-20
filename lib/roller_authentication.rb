# frozen_string_literal: true

require 'roller_authentication/engine'
require 'roller_authentication/dummy_authenticator'

# TODO: raise error if config.users not set

module RollerAuthentication
  def self.setup(&block)
    @config ||= RollerAuthentication::Engine::Configuration.new

    yield @config if block

    @config
  end

  def self.config
    Rails.application.config
  end
end

ActiveSupport.on_load(:action_controller_base) do
  prepend RollerAuthentication::ApplicationHelper
  helper_method :current_user
end
