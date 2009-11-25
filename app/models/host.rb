class Host < ActiveRecord::Base
  has_many :rrd_files
end
