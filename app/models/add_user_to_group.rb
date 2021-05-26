class AddUserToGroup < ApplicationRecord
  validates :user_id, uniqueness: { scope: :room_id }
  belongs_to :user
  belongs_to :room
end
