require File.expand_path('../base', __FILE__)

module DataProvider
  module Collectd
    module Plugins
      class Memory < Base
        def initialize(files)
          @files = files
        end
        
        def metrics
          r = Array.new
          @files.each do |file|
            path = file
            name = "Memory "+File.basename(path, '.rrd').split('-')[1]
            tags = Array.new << 'System/Memory'
            r << DataProvider::Base::MetricResult.new(path, name, tags)
          end
          r
        end
        
        Plugins.register(self)
      end
    end
  end
end