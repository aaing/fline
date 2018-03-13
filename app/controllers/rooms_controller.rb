class RoomsController < ApplicationController

  def new
    @users = User.all
    @room = Room.new
  end

  def create
    tmp = create_params
    tmp["id"].delete("")
    ids = tmp["id"].map {|tmp| tmp.to_i}
    ids << current_user.id
    @room = Room.new
    key = tmp[:key]
    if tmp[:key] != ""
      @room.key = key
    end
    # 登録済み処理
    # exist = false
    # existing_rooms = Room.includes(:users).where( 'users.id' => current_user.id )
    # existing_room = nil
    # existing_rooms.each do |room|
    #   existing_user_ids =  User.includes(:rooms).where( 'rooms.id' => room.id ).ids
    #   if existing_user_ids == ids
    #     exist = true
    #     existing_room = @room
    #   end
    # end
    # binding.pry
    # if exist == true
    #   redirect_to :new_room, alert: '既に作成済みです' and return
    if @room.save
      @room.users << User.find(ids)
      redirect_to action: :show, id: @room.id
    else
      redirect_to :new_room, alert: 'ルーム名を入力してください'
    end

  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end

  def edit
    @room = Room.find(params[:id])
  end

    private
  def create_params
    params.require(:user).permit(id: []).merge(params.require(:room).permit(:key))
  end
end
