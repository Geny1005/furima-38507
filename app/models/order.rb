class Order < ApplicationRecord

  validates :card_number, presence: true
  validates :card_exp_month, presence: true
  validates :card_exp_year, presence: true
  validates :card_cvc, presence: true
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :addresses, presence: true
  validates :building
  validates :phone_number, presence: true

end
