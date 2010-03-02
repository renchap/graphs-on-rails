class Repository < ActiveRecord::Base
  has_many :metrics
  
  def from_param param
    find(param)
  end
end
