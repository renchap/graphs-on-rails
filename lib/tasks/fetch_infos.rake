namespace :fetch do
  desc "Fetch servers list from Munin Servers"
  task :servers => :environment do
    MuninServer.all.each do |munin_server|
      print munin_server.url+' ...'
      begin
        munin_server.fetch_servers_list
        puts ' done'
      rescue Exception => e
        puts ' error - ' + e.to_s
      end
    end
  end
  
  desc "Fetch plugin list for each server"
  task :plugins => :environment do
    Server.all.each do |server|
      print server.hostname+' ...'
      begin
        server.fetch_plugins_list
        puts ' done'
      rescue Exception => e
        puts ' error - ' + e.to_s
      end
    end
  end
end