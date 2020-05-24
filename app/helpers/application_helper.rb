module ApplicationHelper
  def page_title
    title = "Dive into Miyazaki"
    title = @page_title + ' - ' + title if @page_title
    title
  end
end
