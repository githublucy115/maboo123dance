module ApplicationHelper
	def nav_link(link_text, link_path)
	  class_name = current_page?(link_path) ? ' class="active"' : ''

  	  link = link_to link_text, link_path, {:class => "list-group-item"}
  	  link = "<li" + class_name +">" + link + "</li>"
  	  link.html_safe
	end
end
