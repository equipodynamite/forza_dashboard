source 'https://rubygems.org'

ruby '2.5.3'

gem 'rails', '~> 5.2.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'rolify'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'font-awesome-rails'
gem 'chart-js-rails'
gem 'chartkick'
gem 'groupdate'
gem 'bootstrap-datepicker-rails'
gem 'feathericon-sass'


group :development, :test do
  gem "pry"
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 3.8"
  gem "ffaker"

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring-commands-rspec"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "annotate"
end

group :test do
  gem "shoulda-matchers"
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
