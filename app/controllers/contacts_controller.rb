class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params[:contact])
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: Contact.all
  end

  def update
    contact = Contact.new(contact_params[:id])
    contact.update(contact_params[:contact])
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
      contact = Contact.delete(contact_params[:id])
      render text: "deleted!!!"
  end

  def show
    render json: Contact.find(contact_params[:id])
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :user_id)
    end
end
