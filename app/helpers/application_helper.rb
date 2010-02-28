module ApplicationHelper
  def page_title
    if @page_title
      @page_title + ' / RRD on Rails'
    else
      'RRD on Rails'
    end
  end
end
