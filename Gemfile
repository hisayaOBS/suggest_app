# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'actiontext', '6.0.3', require: 'action_text'
gem 'active_hash', '3.1.0'
gem 'active_storage_validations', '0.8.8'
gem 'bootsnap', '1.4.6', require: false
gem 'devise', '4.7.1'
gem 'faker', '2.11.0'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '2.10.0'
gem 'omniauth-facebook', '6.0.0'
gem 'omniauth-google-oauth2', '0.8.0'
gem 'omniauth-twitter', '1.4.0'
gem 'puma', '4.3.3'
gem 'rails', '6.0.3'
gem 'rails-i18n' # imageエラーコード日本語化GEM
gem 'sass-rails', '6.0.0'
gem 'turbolinks', '5.2.1'
gem 'webpacker', '5.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '1.4.2'
end

group :development do
  gem 'listen', '3.2.1'
  gem 'rubocop', require: false # 追記
  gem 'spring', '2.0.1'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console', '4.0.2'
end

group do
  gem 'capybara', '3.32.1'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers', '4.3.0'
end

group :production do
  gem 'devise', '4.7.1'
  gem 'fog', '1.42'
  gem 'pg', '1.1.4'
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
end
