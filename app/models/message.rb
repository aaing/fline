class Message < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :room

  validates_presence_of :user_id, :text, :room_id

end
