class ContactsController < ApplicationController

  def new

    @contact = Contact.new

  end

  def create

    @contact = Contact.new(contact_params)

    @contact.request = request

    if @contact.deliver

      redirect_to root_path
      
      flash.notice = "Email has been sent"
    
    else
     
      redirect_to root_path
      
      flash.notice = "not sent"

    end

  end

  private

  def contact_params

    params.require(:contact).permit(:name, :email, :message)

  end

end
