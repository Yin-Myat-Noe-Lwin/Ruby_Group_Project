class UsersController < ApplicationController

  def new
    

    @user = User.new

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

  private 

  def user_params

   params.require(:user).permit(:name, :email, :password , :password_confirmation, :user_type, :profile )
  
  end

end