# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan'
gem 'devise'
gem 'devise-token_authenticatable'
gem 'dotenv-rails'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.2'
gem 'react-rails'
gem 'rmagick'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'warden'
gem 'webpacker'

group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
