class Message < ApplicationRecord
  belongs_to :room

  validates :text, presence: true, length: {maximum: 172}
  validates :user_name, length: {maximum: 32}

  def to_response
    {
      id: id,
      user_name: user_name,
      text: text,
      created_at: created_at,
    }
  end
end
