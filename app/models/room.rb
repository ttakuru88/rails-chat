class Room < ApplicationRecord
  has_many :messages, dependent: :delete_all

  NAME_LIMIT = 128

  validates :name, presence: true, length: {maximum: NAME_LIMIT}, uniqueness: true

  def expired?
    updated_at < 12.hours.ago
  end
end
