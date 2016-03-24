RachelMundhenke::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  # Bullet configuration (development only)
  config.after_initialize do
    Bullet.enable = false
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer = true
  end
  
  # config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.delivery_method = :ses
  
  # Default URL for Devise, must list actual host in production.rb
  config.action_mailer.default_url_options = { host: 'localhost:3000'}
  
  # Mandrill configuration
  # config.action_mailer.smtp_settings = {
    # :address   => "smtp.mandrillapp.com",
    # :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    # :enable_starttls_auto => true, # detects and uses STARTTLS
    # :user_name => ENV['MANDRILL_USERNAME'],
    # :password  => ENV['MANDRILL_PASSWORD'], # SMTP password is any valid API key
    # :authentication => 'login', # Mandrill supports 'plain' or 'login'
    # :domain => ENV['MANDRILL_DOMAIN'], # your domain to identify your server when connecting
  # }
  
  # Paperclip configuration
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
end
