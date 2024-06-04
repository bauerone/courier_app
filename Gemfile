source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

gem "bootstrap"
gem "sassc-rails"

gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

gem "image_processing", "~> 1.2"

gem "watir"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails", "~> 6.1.0"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "web-console"
  gem "rails-erd"
end

group :test do
  gem "shoulda-matchers"
  gem "rails-controller-testing"
  gem "capybara"
  gem "webdrivers"
end