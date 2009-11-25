class RrdFile < ActiveRecord::Base
  belongs_to :host
  has_many :metrics
end
