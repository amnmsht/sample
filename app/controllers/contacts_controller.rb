class ContactsController < ApplicationController
    def new
      @contact = Contact.new
  end
  
    def create
      #Contact.create(name: params[:name],email: params[:email],content: params[:content])
      #Contact.create(params.require(:contact).permit(:name, :email, :content))
      #Contact.create(contact_params)
      @contact = Contact.new(contact_params)
      if @contact.save
      redirect_to new_contacts_path
    else
      render'new'
  end
end
  
    private
    def contact_params
    params.require(:contact).permit(:name, :email, :content)  
end
end
