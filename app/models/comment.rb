class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :recipe
  belongs_to :user
end
