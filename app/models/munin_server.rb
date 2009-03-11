require 'open-uri'

class MuninServer < ActiveRecord::Base
  has_many :servers
  validates_presence_of :url, :on => :save

  def fetch_page page = ''
    url = self.url+'/'+page
    if self.http_user
      open(url, :http_basic_authentication => [self.http_user, self.http_password])
    else
      open(url)
    end
   
  end

  def fetch_servers_list
    
    # Fetch the munin homepage
    content = self.fetch_page

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
