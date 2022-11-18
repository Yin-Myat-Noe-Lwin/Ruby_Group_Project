class TokensController < ApplicationController

#  def index
#
#    @tokens = Token.all
#
#  end
before_action :check

def check

  if logged_in?

    render 'admins/strict'

end
end

  def new

    @token = Token.new

  end

  def create

    @valid_user = User.find_by(email: params[:token][:email])

    if @valid_user

      @token = Token.new(token_params)

      @token.user_id = @valid_user.id

      @token.password_reset_token = SecureRandom.urlsafe_base64
    
      @token.reset_password_sent_at = Time.now

      @token.save

      PasswordMailer.password_reset(@token).deliver_now

      flash.notice = "Password reset mail has been sent"

      redirect_to root_path

    else

      flash.alert = "Please enter valid email"

      redirect_to(request.env['HTTP_REFERER'])

    end

  end

  def edit

    @token = Token.find_by_password_reset_token!(params[:id])

  end

  def update

    @token = Token.find_by_id(params[:id])

    if params[:token][:password].present? && params[:token][:password_confirmation].present? &&  
       params[:token][:password] == params[:token][:password_confirmation] && 
       params[:token][:password].length >= 8 && params[:token][:password].length <= 30 && params[:token][:password_confirmation].length >= 8 && params[:token][:password_confirmation].length <= 30

      @user = User.find_by_id(@token.user_id)

      @user.update(update_params)

      flash.notice = "Password Reset Successful" 
      
      redirect_to root_path

    elsif @token.reset_password_sent_at < 2.minutes.ago

      flash.alert = "Password Reset Token expired"  

      redirect_to new_token_path

    elsif  params[:token][:password].present? && params[:token][:password_confirmation].present? && 
           params[:token][:password] !=  params[:token][:password_confirmation]

      flash.alert = "Password doesn't match"  

      redirect_to root_path

    elsif params[:token][:password].present? && params[:token][:password_confirmation].present?
          params[:token][:password].length < 8 &&  params[:token][:password].length > 30

      flash.alert = "Password must be min8,max30"  

      redirect_to root_path

    else

      flash.alert = "Please enter correct password"  

      redirect_to root_path

    end

  end

#    if  params[:token][:password].blank? && params[:token][:password_confirmation].blank? && params[:token][:password].length < 8 && params[:token][:password].length > 30 && params[:token][:password_confirmation].length < 8 && params[:token][:password_confirmation].length > 30
#      
#      flash.alert = "Please enter new password correctly(min 8, max30)" 
#      
#      render 'edit'
#   
#    elsif params[:token][:password] != params[:token][:password_confirmation]
#      
#      flash.alert = "Password doesn't match"  
#      
#      render 'edit'
#    
#    elsif @token.reset_password_sent_at < 2.minutes.ago
#      
#      flash.alert = "Password Reset Token expired"  
#
#      redirect_to new_token_path
#
#    else
#
#      @user = User.find_by_id(@token.user_id)
#
#      @user.update(update_params)
#
#      flash.notice = "Password Reset Successful" 
#
#      redirect_to root_path
#
#     end

  private 

  def token_params

    params.require(:token).permit( :password_reset_token, :user_id, :reset_password_sent_at)
  
  end

  def update_params

    params.require(:token).permit(:password,:password_confirmation)

  end

end