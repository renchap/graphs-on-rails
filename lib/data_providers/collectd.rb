require File.expand_path('../rrdtool', __FILE__)

module DataProvider
  class Collectd < RRDTool
    def initialize(path)
      @path = path
    end
    
    def self.short_name
      'collectd'
    end
    
    def get_all_metrics
      result = Hash.new
      # Each dir is an host
      Dir.foreach(@path) do |host|
        host_path = @path+'/'+host
        if File.directory?(host_path) and not host =~ /^\./
          puts "Found host #{host}"
          host_result = Array.new
          # Each dir is a plugin
          Dir.foreach(host_path) do |plugin|
            plugin_path = host_path+'/'+plugin
            if File.directory?(plugin_path) and not plugin =~ /^\./
              puts "Found plugin #{plugin}"
              Dir.foreach(plugin_path) do |file|
                file_path = plugin_path+'/'+file
                if File.file?(file_path) and file =~ /\.rrd$/
                  # This is an rrd data file
                  puts "Got a data file : #{file}"
                  host_result << "#{plugin}/#{file.gsub(/\.rrd$/,'')}"
                end
              end
            end
          result[host] = host_result
          end
        end
      end
      result
    end
    
    DataProvider.register(self)
  end
end