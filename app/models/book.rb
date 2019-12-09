class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews
  validates :name, presence: true, length: { maximum: 40}
  validates :text, presence: true, length: { maximum: 650}
end