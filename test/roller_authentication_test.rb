# frozen_string_literal: true

require 'test_helper'

module RollerAuthentication
  class Test < ActiveSupport::TestCase
    test 'is a module' do
      assert_kind_of Module, RollerAuthentication
    end

    test 'has configs' do
      assert_equal Rails.application.config, RollerAuthentication.config
    end
  end
end
