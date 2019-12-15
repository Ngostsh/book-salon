class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews
  has_many :books_tags
  has_many :tags, through: :books_tags
  validates :name, presence: true, length: { maximum: 40}
  validates :text, presence: true, length: { maximum: 650}
end