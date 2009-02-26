class Plugin < ActiveRecord::Base
  has_many :server_plugins
  has_many :servers, :through => :server_plugin
end
