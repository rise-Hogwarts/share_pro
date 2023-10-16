class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :genre_id, presence: true
  validates :ingredients, presence: true
  validates :explanation, presence: true
  validates :protein, numericality: {only_integer: true}
  validates :image, presence: true


  belongs_to :member, optional: true
  belongs_to :genre, optional: true
  has_many :goods, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :image

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
       all
    end
  end

  scope :latest, -> {order(created_at: :desc)} #新着順
  scope :old, -> {order(created_at: :asc)} #古い順
  scope :many_protein, -> {order(protein: :desc)} #たんぱく質が多い順
  scope :few_protein, -> {order(protein: :asc)} #たんぱく質が少ない順

  def good_by?(member)
    goods.exists?(member_id: member.id)
  end

end
