class Host < ActiveRecord::Base
  has_many :metrics
  
  validates_format_of :name, :without => /\s/, :message => "must not contain any spaces"
  
#  def to_param
#    self.name
#  end
  
  def self.from_param(param)
    find(param)
  end
end
