# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bandmanager_session',
  :secret      => 'f0e647b0e966e14f6f443f9f8dd24c2bbd41cf0dfd6a5974788963148cba8acd0d03bf924d6b785fc85b5b5c5664346fd02d7bedc2c569b19477fa3e59a6a3de'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
