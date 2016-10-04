class ContactSharesController < ApplicationController
  def create
    contact_share = ContactShare.new(contact_share_params[:contact_share])
    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: ContactShare.all
  end

  def update
    contact_share = ContactShare.new(contact_share_params[:id])
    contact_share.update(contact_share_params[:contact_share])
    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
      contact_share = ContactShare.delete(contact_share_params[:id])
      render text: "deleted!!!"
  end

  def show
    render json: ContactShare.find(contact_share_params[:id])
  end

  private
    def contact_share_params
      params.require(:contact_share).permit(:contact_id, :user_id)
    end
end
