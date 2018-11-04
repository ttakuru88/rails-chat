class Message < ApplicationRecord
  belongs_to :room

  validates :text, presence: true, length: {maximum: 172}
  validates :user_name, length: {maximum: 32}
end
