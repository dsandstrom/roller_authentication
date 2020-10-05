class User
  include ActiveModel::Model

  attr_accessor :email

  def self.find_by_email
  end
end
