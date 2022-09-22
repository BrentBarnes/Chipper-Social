class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :post_content, presence: true
end
