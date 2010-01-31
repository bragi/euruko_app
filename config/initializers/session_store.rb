# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_euruko_session',
  :secret      => 'eecbbfe4094ec3af768d4013fb9189b33280ccd2486723254c857a37e79ff5f1069af82fe93db0434e908525c6a4a0a93eb113087f43e7c913e1ecf6e7dd66a7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
