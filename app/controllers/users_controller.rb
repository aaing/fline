class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def rooms_list
    # binding.pry
    @rooms = User.find(params[:id]).rooms
  end

  def friends_list
    user = User.all
    @users = user.where.not(name: nil)
    # binding.pry
  end

  def update
    current_user.update(update_params)
  end

  def update_params
    params.require(:user).permit(:name, :user_id, :avatar)
  end
end
