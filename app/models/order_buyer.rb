class OrderBuyer
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number
    validates :order_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
end