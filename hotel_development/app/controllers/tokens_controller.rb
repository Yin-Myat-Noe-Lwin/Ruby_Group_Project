class TokensController < ApplicationController

  def index

    @tokens = Token.all

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

      redirect_to root_path

    else

      flash.notice = "Please enter valid email"

      render 'new'

    end

  end

  def edit

    @token = Token.find_by_password_reset_token!(params[:id])

  end

  def update

    @token = Token.find_by_id(params[:id])

    if  params[:token][:password].blank? && params[:token][:password_confirmation].blank?
      
      flash.notice = "please enter new password" 
      
      render 'edit'
   
    elsif params[:token][:password] != params[:token][:password_confirmation]
      
      flash.notice = "password and password confirmation don't match"  
      
      render 'edit'
    
    elsif @token.reset_password_sent_at < 2.minutes.ago
      
      flash.notice = "password reset token expired"  

      redirect_to new_token_path

    else

      @user = User.find_by_id(@token.user_id)

      @user.update(update_params)

      flash.notice = "password reset successful" 

      redirect_to root_path

     end

   end

  private 

  def token_params

    params.require(:token).permit(:password_reset_token, :user_id, :reset_password_sent_at)
  
  end

  def update_params

    params.require(:token).permit(:password,:password_confirmation)

  end

end