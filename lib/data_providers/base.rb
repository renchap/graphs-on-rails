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
    def self.short_name
      throw Exception.new('DataProvider::Base cant be directly used')
    end
  end
end