# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_survey_session',
  :secret      => 'dc4f59d4d2fa77e2ca28658a3ff04ba435051494a8bb78680738d78c8314ad7c661420f7e24977f1c74192a91d511723dfcaa0797f1c666c6c9c28a450481676'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
