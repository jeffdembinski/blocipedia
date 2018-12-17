source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby '2.4.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

group :production do
  # Use pg as the production database for Active Record
  gem 'pg', '~> 0.20.0'
end

group :development do
  # Use sqlite3 as the development database for Active Record
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
end

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'thor', '0.20.0'

gem 'bootsnap', '>= 1.1.0', require: false

# GEM files that I've added for the Blocipedia Project
gem 'devise'
gem 'redcarpet'
gem 'figaro'
gem 'bootstrap-sass'
gem 'bootstrap', '~> 4.1.1'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'coffee-rails', '~> 4.2'
gem 'pundit'
gem 'faker'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

group :development do
  gem 'listen', '>= 3.0.5', '<3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
