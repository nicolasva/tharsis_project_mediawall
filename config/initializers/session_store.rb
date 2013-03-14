# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_newproject_session',
  :secret      => 'd15db0f23da88b296dd0bba55df1cc1bf089d6cd20eaf9f04e3223339699cf93e595b23817f6f24199c252da0948c7c6a6b35ea304859bf742353aaa7ca38cf6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
