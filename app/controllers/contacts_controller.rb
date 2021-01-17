class ContactsController < ApplicationController

  def index
    if params[:search].present?
      @contacts = Contact.where("first_name =? or mobile_number =?", params[:search], params[:search])
    else
      @contacts = Contact.all
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      redirect_to contacts_new_path
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @contact.update(counter: @contact.counter+1)
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render 'edit'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :middle_name, :last_name, :email, :mobile_number, :landline_number, :notes, :photo)
  end
end