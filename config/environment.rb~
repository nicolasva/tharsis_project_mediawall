# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  #Define login and password FTP for the virtual filesystem
  CONFIG_FTP = YAML::load_file("#{RAILS_ROOT}/config/log_ftp_dreamhost.yml")
  config.gem 'Ascii85', :version => '~> 1.0.0'
  config.gem 'authlogic'
  config.gem 'paperclip'
  config.gem 'will_paginate'
  config.gem 'whenever'
  config.gem 'spreadsheet'
  config.gem 'rails_sql_views'
  config.gem 'geokit'
  #require 'geokit'
  #include Geokit::Geocoders
  require 'rails_sql_views'
  #config.gem 'float-formats'
  #config.gem 'whenever'
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Paris'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
   config.i18n.default_locale = :fr
end

#ActionMailer::Base.delivery_method = :smtp

#ActionMailer::Base.smtp_settings = {
#  :enable_starttls_auto => true,
#  :address => '95.142.171.246',
#  :port => 465,
#  :domain => '95.142.171.246',
#  :user_name => 'mail',
#  :password => 'm956gJG',
#  :authentication => :plain,
#}

# ActionMailer::Base.delivery_method = :sendmail
