class HomeController < ApplicationController
  
  before_action :check

  def check

    if logged_in?
    if current_user.user_type == '0' 
      #raise ActionController::RoutingError, 'Not Found'
      render 'logout_Page'
    end
  end

  end

  def homePage
  end

end
