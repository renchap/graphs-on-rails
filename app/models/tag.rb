class Tag < ActiveRecord::Base
  belongs_to :parent, :class_name => "Tag", :foreign_key => "parent_id"
  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"

  has_many :metric_tags
  has_many :metrics, :through => :metric_tags

  def self.find_or_create_by_path(path)
    # Split the path into tags
    tags = path.split('/')
    parent_tag_id = nil
    tag = nil
    tags.each do |t|
      tag = Tag.find_or_create_by_name_and_parent_id(t, parent_tag_id)
      parent_tag_id = tag.id
    end
    tag
  end
end
