module ApplicationHelper

  def current_class?(test_path)

    request.path == test_path ? 'sidebarActive' : ''

  end

  def active_class?(test_path)

    request.path == test_path ? 'nav-active' : ''

  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

end