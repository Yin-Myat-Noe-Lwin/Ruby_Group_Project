class PasswordMailer < ApplicationMailer

  default from: "yinmyatnoelwin1@gmail.com"

  def password_reset(token)

    @token = token

    mail to: token.user.email, subject: "Password Reset"
    
  end

end
