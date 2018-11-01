class Room < ApplicationRecord
  NAME_LIMIT = 128

  validates :name, presence: true, length: {maximum: NAME_LIMIT}
end
