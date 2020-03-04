# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'friendly_id'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'maskmoney-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'pundit'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'toastr-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubycritic'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
