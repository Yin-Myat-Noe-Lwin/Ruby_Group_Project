class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def current_user

    if (user_id = session[:user_id])

      @current_user ||= User.find_by(id: user_id)

    end

  end

  def logged_in?

    !!current_user

  end

end
