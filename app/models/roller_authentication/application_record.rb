# frozen_string_literal: true

module RollerAuthentication
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
