class DropTableUsersRooms < ActiveRecord::Migration
  def change
    drop_table :users_rooms
  end
end
