class Repository < ActiveRecord::Base
  self.inheritance_column = 'subclass_type'
  has_many :metrics
  
  def self.from_param(param)
    find(param)
  end
end
