class ContactsController < ApplicationController
  
  before_action :check

  def check

    if logged_in?

      if current_user.user_type == '0' 

        render 'admins/strict'

      end

    else 

      render 'sessions/loginForm'

    end

  end

  def new

    @contact = Contact.new

  end

  def create

    @contact = Contact.new(contact_params)

    @contact.request = request

    if @contact.deliver
      
      flash.notice = "Email has been sent"

      redirect_to root_path
    
    else
      
      flash.alert = "Message not sent"

      redirect_to root_path

    end

  end

  private

  def contact_params

    params.require(:contact).permit(:name, :email, :message)

  end
end
