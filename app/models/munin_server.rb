require 'open-uri'

class MuninServer < ActiveRecord::Base
  has_many :servers

  def fetch_servers_list
    # Fetch the munin homepage
    doc = Hpricot(open(self.url))
    
    # Search all servers
    (doc/"span.host"/"a").each do |server|
      server_name = server.inner_html
      unless self.servers.find(:first, :conditions => { :hostname => server_name })
       puts "Adding "+server_name
        self.servers.create(:hostname => server_name)
      end
    end
    return true
  end
end
