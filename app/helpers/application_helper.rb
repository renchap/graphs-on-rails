module ApplicationHelper
  def page_title
    if @page_title
      @page_title + ' / Graphs on Rails'
    else
      'Graphs on Rails'
    end
  end
end
