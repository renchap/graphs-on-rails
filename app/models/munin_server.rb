require 'open-uri'

class MuninServer < ActiveRecord::Base
  has_many :servers

  def fetch_servers_list
    
    # Fetch the munin homepage
    if self.http_user
      content = open(self.url, :http_basic_authentication => [self.http_user, self.http_password])
    else
      content = open(self.url)
    end
    
    doc = Hpricot(content)
    
    # Search all servers
    (doc/"span.host"/"a").each do |server|
      server_name = server.inner_html
      unless self.servers.find(:first, :conditions => { :hostname => server_name })
        self.servers.create(:hostname => server_name, :group => server['href'].split('/')[0])
      end
    end
    return true
  end
end
