class Snap < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
