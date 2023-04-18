class Recipe < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :genre, optional: true
  has_many :goods, dependent: :destroy
  has_many :comments

  has_one_attached :image

  scope :latest, -> {order(created_at: :desc)} #新着順
  scope :old, -> {order(created_at: :asc)} #古い順
  scope :star_count, -> {order(star: :desc)} #評価順
  scope :many_protein, -> {order(protein: :desc)} #たんぱく質が多い順
  scope :few_protein, -> {order(protein: :asc)} #たんぱく質が少ない順
end
