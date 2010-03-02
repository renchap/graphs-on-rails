class Host < ActiveRecord::Base
  has_many :metrics
  
#  def to_param
#    self.name
#  end
  
  def self.from_param(param)
    find(param)
  end
end
