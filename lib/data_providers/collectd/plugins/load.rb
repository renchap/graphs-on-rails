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
          {'shortterm' => 1, 'midterm' => 5, 'longterm' => 15}.each do |term,interval|
            r << metric = MetricResult.new
            metric.name = "Load average - #{interval} minute#{'s' if interval != 1} average"
            metric.tags << 'System/Load Average'
            metric.options[:path] = @files.first[:relative_path]
            metric.options[:rra] = term
            metric.options[:minimum] = 0
          end
          r
        end

        Plugins.register(self)
      end
    end
  end
end
