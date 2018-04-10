class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    if current_user.id == 1
        @contact = Contact.new
    else
      redirect_to root_path
    end  
  end
 
  def edit
    if current_user.id == 1
      @contact = Contact.find(params[:id])
    else
      redirect_to root_path
    end 
  end
 
  def create
    @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to @contact, notice: 'Contact was successfully created.'
      else
        render 'new'
      end
  end

  def update
      @contact = Contact.find(params[:id])

      if @contact.update(contact_params)
        redirect_to @contact, notice: 'Contact was successfully updated.'
      else
        render 'edit' 
      end
  end

  def destroy
    @contact.destroy
      redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
  
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:country, :oblast, :city, :street1, :street2, :mobile1, :mobile2, :fax, :email)
    end
end
