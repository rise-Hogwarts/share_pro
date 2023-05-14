class Good < ApplicationRecord
  belongs_to :member
  belongs_to :recipe

   def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
       all
    end
   end
end
