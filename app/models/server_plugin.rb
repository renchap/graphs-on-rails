class ServerPlugin < ActiveRecord::Base
  belongs_to :server
  belongs_to :plugin
end
