class Snap < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :favorite_relationships
  # userを取得
  has_many :favorite_users, through: :favorite_relationships, source: :user
end
