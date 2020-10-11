# frozen_string_literal: true

class User
  include ActiveModel::Model

  VALID_EMPLOYEE_TYPES = %w[Admin Reporter Reviewer Worker].freeze

  attr_accessor :email

  def self.find_by_email(email); end

  def self.employees(_type = nil)
    self
  end

  def self.map
    [].map
  end
end
