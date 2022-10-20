class OrderAddress


  include ActiveModel::Model
  attr_accessor :postal_code, :sender_area_id, :city, :address, :phone_number, :user_id, :building, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
    #validates :user_id
    #validates :item_id
  end

  validates :sender_area_id, numericality: { other_than: 1 , message: "can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, sender_area_id: sender_area_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end