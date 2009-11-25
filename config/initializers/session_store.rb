# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rrd-on-rails_session',
  :secret      => '8cd5979e8c0840245c59e665ee78313866af1e058d245a6d47abe835dfebd83e8c7890d18a5f880520a1594880811a01c3778aee6a503bf7341434e724dafe29'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
