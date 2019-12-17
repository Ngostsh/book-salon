class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, presence: true, length: { maximum: 1000}
  validates :rate, presence: true
end