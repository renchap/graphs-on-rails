# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_rrd-on-rails_session',
  :secret => 'cebffac6ceb689900429ec1196a7703e5469dfa6a9162f7e6dc084c98130b72ced1222c6a642046ca2699dd03b4fcf54254269d486a2a60005fba94656f75abb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
