class Room < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :messages, ->{ order("created_at DESC") }
  validates :key, presence: true
end
