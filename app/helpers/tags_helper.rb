module TagsHelper
  def pretty_tag_path(tag)
    tag.path.map { |t| t.name }.join(' / ')
  end
end
