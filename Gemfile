# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0.beta'
gem 'chartjs-ror'
gem 'coffee-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'normalize-rails'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'russian'
gem 'sass-rails'
gem 'shrine'
gem 'simple_form'
gem 'slim-rails'
gem 'therubyracer', platforms: :ruby
gem 'trix'
gem 'turbolinks'
gem 'uglifier'

group :development do
  gem 'listen'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
