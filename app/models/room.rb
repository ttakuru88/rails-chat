class Room < ApplicationRecord
  has_many :messages, dependent: :delete_all

  NAME_LIMIT = 128

  validates :name, presence: true, length: {maximum: NAME_LIMIT}, uniqueness: true
end
