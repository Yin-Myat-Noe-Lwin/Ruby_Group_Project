class UserService

  class << self

    def getAllUsers

      @users = UserRepository.getAllUsers

    end

    def createUser(user)

      @is_user_create = UserRepository.createUser(user)

    end

    def findByEmail(email)

      @user=UserRepository.findByEmail(email)

    end

  end

end