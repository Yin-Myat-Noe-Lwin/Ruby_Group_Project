module ApplicationHelper

  def current_class?(test_path)

    request.path == test_path ? 'sidebarActive' : ''

  end

  def active_class?(test_path)

    request.path == test_path ? 'nav-active' : ''

  end

end