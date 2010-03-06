module DataProvider
  module Collectd
    module Plugins
      def self.from_shortname(short_name)
        @plugins[short_name]
      end

      def self.register(plugin)
        @plugins = Hash.new unless @plugins
        @plugins[plugin.short_name] = plugin
      end

      def self.list
        @plugins
      end
      
      class Base
        def self.short_name
          self.name.split('::').last.downcase
        end
      end
    end
  end
end