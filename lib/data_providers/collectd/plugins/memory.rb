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
            r << metric = MetricResult.new
            metric.name = "Memory "+File.basename(file, '.rrd').split('-')[1]
            metric.tags << 'System/Memory'
            metric.options[:path] = file
            metric.options[:rra] = 'value'
          end
          r
        end
        
        Plugins.register(self)
      end
    end
  end
end