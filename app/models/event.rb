class Event < ApplicationRecord
  belongs_to :user
  belongs_to :room, optional: true

  validates :title, presence: true
  validates :start, presence: true
  validates :end,   presence: true

  validate :start_end_check

  def start_end_check
    errors.add(:end, "は開始時刻より遅い時間を選択してください") if self.start > self.end
  end
end
