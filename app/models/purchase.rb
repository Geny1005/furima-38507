class OrderAdress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :phone_number

  # ここにバリデーションの処理を書く

  validates :postal_code, presence: true,
             format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city, presence: true,
             format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :addresses, presence: true
  validates :phone_number, presence: true,
             format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}



  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end