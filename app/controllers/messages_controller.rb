class MessagesController < ApplicationController
    def create
    Message.create(create_params)
    redirect_to controller: :rooms, action: :show, id: params[:room_id]
  end

  private
  def create_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
