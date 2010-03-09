require File.expand_path('../../rrdtool/rrdtool', __FILE__)

module DataProvider
  module Collectd
    class Provider < RRDTool::Provider
      def initialize(path)
        @path = path
        
        self.load_plugins(__FILE__)
      end
      
      def get_all_metrics
        result = Hash.new
        # Each dir is an host
        Dir.foreach(@path) do |host|
          host_path = @path+'/'+host
          if File.directory?(host_path) and not host =~ /^\./
            host_metrics = Array.new
            # Each dir is a plugin
            Dir.foreach(host_path) do |plugin|
              plugin_path = host_path+'/'+plugin
              if File.directory?(plugin_path) and not plugin =~ /^\./
                plugin_files = Array.new
                Dir.foreach(plugin_path) do |file|
                  file_path = plugin_path+'/'+file
                  if File.file?(file_path) and file =~ /\.rrd$/
                    # This is an rrd data file
                    plugin_files << file_path
                  end
                end
                
                if plugin_files.length > 0
                  # Is it an handler for this plugin ?
                  handler = Plugins.from_shortname(plugin)
                  if handler
                    h = handler.new(plugin_files)
                    host_metrics = host_metrics + h.metrics
                  else
                    # TODO: create a default handler
                  end
                end
              end
            end
            result[host] = host_metrics
          end
        end
        result
      end
      
      def get_data(start_date, end_date, options)
        rrd = RRD::Base.new(options[:path])
        results = rrd.fetch(:average, :start => start_date, :end => end_date)
        r = Array.new
        
        index = results.first.index(options[:rra])
        # Delete first line of results as it contains rra names
        results.delete_at(0)
        
        results.each do |line|
          r << [line[0], line[index]] if line[index] and line[index].class == Float and !line[index].nan?
        end
        rrd = nil
        r
      end
      
      DataProvider.register(self)
    end
  end
end
