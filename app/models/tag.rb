class Tag < ActiveRecord::Base
  belongs_to :parent, :class_name => "Tag", :foreign_key => "parent_id"
  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
end
