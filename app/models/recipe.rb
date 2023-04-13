class Recipe < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :genre, optional: true
  has_many :comments

  has_one_attached :image
end
