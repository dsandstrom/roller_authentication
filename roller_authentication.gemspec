$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "roller_authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "roller_authentication"
  spec.version     = RollerAuthentication::VERSION
  spec.authors     = ["Darrell Sandstrom"]
  spec.email       = ["darrell.sandstrom@gmail.com"]
  spec.homepage    = "https://homepage.com"
  spec.summary     = "Summary of RollerAuthentication."
  spec.description = "Description of RollerAuthentication."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files =
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.3"

  spec.add_development_dependency "sqlite3", '~> 1.4'
end
