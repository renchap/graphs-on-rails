require File.expand_path('../base', __FILE__)

module DataProvider
  module Collectd
    module Plugins
      class Load < Base
        def initialize(files)
          # Check that we have only one file for this plugin
          throw Exception.new('Collectd::Load plugin can have only one file') if files.size != 1
         
          @files = files
        end
        
        def metrics
          r = Array.new
          path = @files.first
          name = "Load average"
          tags = Array.new << 'System'
          r << DataProvider::Base::MetricResult.new(path, name, tags)
        end
        
        Plugins.register(self)
      end
    end
  end
end