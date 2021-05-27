class Room < ApplicationRecord
  attachment :image

  has_many :user_rooms
  has_many :chats
  has_many :add_user_to_groups
  has_many :events
  has_many :users, through: :user_rooms

  validates :name, presence: true,
                   length: { maximum: 15 }
end
