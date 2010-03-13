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
            metric.name = "Memory "+File.basename(file[:full_path], '.rrd').split('-')[1]
            metric.tags << 'System/Memory'
            metric.options[:path] = file[:relative_path]
            metric.options[:rra] = 'value'
            metric.options[:unit] = :bytes
            metric.options[:minimum] = 0
          end
          r
        end
        
        Plugins.register(self)
      end
    end
  end
end
