class SessionsController < ApplicationController

  def loginForm
  end

  def login

    @user = UserService.findByEmail(email: params[:session][:email])

    if @user  && (@user.password == params[:session][:password])

      session[:user_id] = @user.id
      
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)

      if @user.user_type == '1'

        redirect_to root_path 
  
      else
  
        redirect_to dashboard_path 
  
      end

    else

      flash.notice = "User not found"

      render 'loginForm'

    end  
    
  end
  
  def logout

    forget(current_user)

    session.delete(:user_id)

    @current_user = nil

    flash.notice="Logged out"
    
    redirect_to root_path

  end

end