module ApplicationHelper

  def current_class?(test_path)

    request.path == test_path ? 'sidebarActive' : ''

  end
  
end
