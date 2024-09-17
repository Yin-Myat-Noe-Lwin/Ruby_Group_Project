class UserRepository
  
  class << self
    
    def getAllUsers

      @users = User.all

    end

    def createUser(user)

      @is_user_create = user.save

    end

    def findByEmail(email)

      @user = User.find_by(email)
      
    end

  end

end