class Room < ApplicationRecord
  validates :name, presence: true, length: {maximum: 128}
end
