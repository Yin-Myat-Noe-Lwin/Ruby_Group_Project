class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

#  def current_user
#
#    if (user_id = session[:user_id])
#
#      @current_user ||= User.find_by(id: user_id)
#
#    end
#
#  end

  def current_user

    if (user_id = session[:user_id])

      @current_user ||= User.find_by(id: user_id)

    elsif (user_id = cookies.signed[:user_id])

      @user = User.find_by(id: user_id)

      if @user

        session[:user_id] = @user.id

        @current_user = @user

      end

    end

  end

  def logged_in?

    !!current_user

  end

  def remember(user)

    cookies.signed[:user_id] = { value: user.id  , expires: Time.now + 2.minutes }

    cookies.signed[:remember_token] = { value: user.remember_token  , expires: Time.now + 2.minutes }

#    cookies.permanent.signed[:user_id] = user.id
#
#    cookies.permanent[:remember_token] = user.remember_token

  end

  def forget(user)

    cookies.delete(:user_id)

    cookies.delete(:remember_token)

  end

end