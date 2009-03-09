# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    if @page_title
      'Munin on Rails / '+@page_title
    else
      'Munin on Rails'
    end
  end
  
  def set_page_title title
    @page_title = title
  end
end
