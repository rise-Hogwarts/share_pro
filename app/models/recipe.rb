class Recipe < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :comments

  has_one_attached :image
end
