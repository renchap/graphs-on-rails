require 'open-uri'

class Server < ActiveRecord::Base
  belongs_to :munin_server
  has_many :server_plugins
  has_many :plugins, :through => :server_plugins

  def fetch_plugins_list
    # Fetch the server page
    content = self.munin_server.fetch_page(self.group+'/'+self.hostname+'.html')

    doc = Hpricot(content)

    (doc/"div.lighttext"/"a").each do |plugin_line|
      # Remove hostname at start of the href, and .html extension
      plugin_name = plugin_line['href'].sub(self.hostname+'-','').slice(0..-6)
      plugin = Plugin.find_or_create_by_name(plugin_name)
      unless self.plugins.find(:first, :conditions => { :id => plugin })
        self.plugins << plugin
      end
    end
  end
end
