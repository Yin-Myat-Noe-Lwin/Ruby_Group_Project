class UsersController < ApplicationController

  def new

    if logged_in? 

      render 'admins/strict'

    else

      @user = User.new

    end
  
  end

  def create

    @user = User.new(user_params)

    @upload = params[:user][:profile]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/profiles', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

      @user.profile =  "profiles/" + @upload.original_filename
        
      end

    end

    @is_user_create = UserService.createUser(@user)

    if @is_user_create 

      flash.notice="Sign up successful"

      redirect_to root_path

    else

      render 'new'

    end

  end

  def show

    if logged_in?  &&  current_user.user_type == '0'
   
      @user = User.find_by_id(params[:id])

    else 

      render 'admins/strict'
   
    end

  end

  def index

    if logged_in? && current_user.user_type == '0'

    @users = UserService.getAllUsers

    else 

      render 'admins/strict'

    end
    
  end
  
  private 

  def user_params

   params.require(:user).permit(:name, :email, :password , :password_confirmation, :user_type, :profile )
  
  end

end