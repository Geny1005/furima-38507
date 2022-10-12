class Item < ApplicationRecord

  belongs_to :user
  has_one :history
  has_one_attached :image

  validates :name, presence: true
  validates :information, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :sender_area_id, presence: true
  validates :schedule_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}

end

