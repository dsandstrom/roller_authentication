class User
  include ActiveModel::Model

  VALID_EMPLOYEE_TYPES = %w[Admin Reporter Reviewer Worker].freeze

  attr_accessor :email

  def self.find_by_email(email)
  end

  def self.employees(type = nil)
    []
  end
end
