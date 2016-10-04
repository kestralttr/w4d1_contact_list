class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def new
    render text: "new2?"
  end

  def create
    user = User.new(user_params[:user])
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(user_params[:id])
    user.update(user_params[:user])
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.delete(user_params[:id])
    render text: "it was deleted"
  end

  private


  def user_params
     params.require(:user).permit(:username)
   end
end
