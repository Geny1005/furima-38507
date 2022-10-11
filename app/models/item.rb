class Item < ApplicationRecord

  belongs_to :user
  has_one :history
  has_one_attached :image

  

end
