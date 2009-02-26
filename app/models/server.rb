class Server < ActiveRecord::Base
  belongs_to :munin_server
  has_many :server_plugins
  has_many :plugins, :through => :server_plugins
end
