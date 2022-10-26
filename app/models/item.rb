class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, presence: true
  validates :information, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :sender_area_id, presence: true
  validates :schedule_id, presence: true
  
  validates :user, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"} 

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "を入力してください"}

  belongs_to :delivery_burden
  validates :delivery_burden_id, numericality: { other_than: 1 , message: "を入力してください"}

  belongs_to :sender_area
  validates :sender_area_id, numericality: { other_than: 1 , message: "を入力してください"}

  belongs_to :schedule
  validates :schedule_id, numericality: { other_than: 1 , message: "を入力してください"}

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
    presence: { message: "を入力してください"}
  end

end

