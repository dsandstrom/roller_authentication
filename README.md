# RollerAuthentication
Simple authentication gem for test and development environments.

[![Ruby Tests Actions Status](https://github.com/dsandstrom/roller_authentication/workflows/Ruby%20Tests/badge.svg)](https://github.com/dsandstrom/roller_authentication/actions?query=workflow%3A%22Ruby+Tests%22)

[![Rubocop Actions Status](https://github.com/dsandstrom/roller_authentication/workflows/Rubocop/badge.svg)](https://github.com/dsandstrom/roller_authentication/actions?query=workflow%3ARubocop)

Made for https://github.com/dsandstrom/task_roller

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'roller_authentication', github: 'dsandstrom/roller_authentication'
```

And then execute:
```bash
$ bundle
```

## Usage

Add an initializer to provide the app's User class:

```ruby
# config/initializers/roller_authentication.rb
RollerAuthentication.setup do |config|
  config.user_class = User
end
```

Use `authenticate` helper in your controllers to force users to sign in:

```ruby
# config/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # ..
  before_action :authenticate
  # ..
end
```

Other helpers:

* `current_user` - Signed in user
* `user_signed_in?` - Check if a current_user
* `authentication_controller?` - Check if the current action is from this gem's AuthenticationController (used to disable authorization)

## Contributing
Yes please.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
