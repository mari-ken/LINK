class Event < ApplicationRecord
  belongs_to :user
  belongs_to :room, optional: true
end
