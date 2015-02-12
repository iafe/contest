source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.1.2'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# The admin dashboard functionality, also installs formtastic, jquery-ui-rails, kaminari, polyamorous, and ransack (and devise)
# Puts an email field in the user table, do not create a new user's table, use this instead and add extra fields to the generated migration
# Move the generated css file into vendor assets
gem 'devise', '3.4.1' # needed for production
gem 'activeadmin', github: 'gregbell/active_admin'

# Country-select dropdown
gem 'country_select', '2.1.1'

# Allows for HTML markup in input fields
gem 'sanitize', '3.1.1'

# Upload documents/images
gem 'paperclip', '4.2.1'

# Tells app where S3 credentials are
gem 'figaro', '1.1.0'

# Communicates with Amazon S3 Account
gem 'aws-sdk', '< 2.0'

# Transforms YouTube links into embeddable content
gem 'auto_html', '1.6.4'

# Test e-mail in development environment (opens in browser instead)
gem 'letter_opener', group: :development

# Searches for belongs_to relationships via a drop-down form
gem 'select2-rails', '3.5.9.2'

# Installs bootstrap with SASS compatibility
gem 'bootstrap-sass', '3.3.3'

# Provides pdf generation capability
gem 'wkhtmltopdf-binary', '0.9.9.3'
gem 'wicked_pdf', '0.11.0'
gem "wkhtmltopdf-heroku", '1.0.0'

# Denies or allows access to certain pages
gem 'cancan', '1.6.10'

# Detects N+1 queries/helps with optimization
gem 'bullet', group: :development

# Allows transaction e-mail
gem 'mandrill-api', '1.0.53'

# Heroku uses PostgreSQL for the database and needs rails_12factor for the asset pipeline as of Rails 4
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
  gem 'newrelic_rpm', '3.9.9.275'
end