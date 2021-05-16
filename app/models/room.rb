class Room < ApplicationRecord
  attachment :image

  has_many :user_rooms
  has_many :chats
  # has_many :events
  has_many :users, through: :user_rooms
end
