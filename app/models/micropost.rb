class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }

  def today?(day)
    :updated_at == day ? true : false
  end
end
