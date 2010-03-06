module DataProvider
  def self.from_shortname(short_name)
    @providers[short_name]
  end
  
  def self.register(data_provider)
    @providers = Hash.new unless @providers
    @providers[data_provider.short_name] = data_provider
  end
  
  def self.list
    @providers
  end
  
  class Base
    @@plugins_loaded = false
    
    class MetricResult
      attr_reader :path, :name, :tags
      
      def initialize(path, name, tags)
        @name = name
        @tags = tags
        @path = path
      end
    end
    
    def self.short_name
      self.name.split('::')[1].downcase
    end
    
    def load_plugins(base)
      unless @@plugins_loaded
        # Load all plugin handlers
        plugin_dir_path = File.expand_path('../plugins',base)
        Dir.foreach(plugin_dir_path) do |plugin|
          plugin_path = plugin_dir_path+'/'+plugin
          if File.file?(plugin_path) and not plugin =~ /^\./ and plugin =~ /\.rb$/
            require plugin_path
          end
        end
        @@plugins_loaded = true
      end
    end
  end
end