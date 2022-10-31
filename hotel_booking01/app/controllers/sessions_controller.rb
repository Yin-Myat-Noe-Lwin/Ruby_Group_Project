class SessionsController < ApplicationController

  def loginForm
  end

  def login

    @user = UserService.findByEmail(email: params[:session][:email])

    if @user  && (@user.password == params[:session][:password])

      session[:user_id] = @user.id

      flash.notice="Logged in"

      if @user.user_type == '1'

      redirect_to root_path 

      else

        redirect_to dashboard_path 

      end

    else

      render 'loginForm'

    end  
    
  end

  
  def logout

    session.delete(:user_id)

    flash.notice="Logged out"
    
    redirect_to root_path

  end

end