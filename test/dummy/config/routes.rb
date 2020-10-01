Rails.application.routes.draw do
  mount RollerAuthentication::Engine => "/roller_authentication"
end
