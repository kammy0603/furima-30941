class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :address, :building_number, :phone_number
  attr_accessor :token
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "-を使用してください" }
    validates :prefecture
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "半角数字を使用してください" }
    validates :token
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture
  end

  def save
    user = User.create
    item = Item.create 
    Order.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, address: address, building_number: building_number, phone_number: phone_number)
    Purchase.create(user_id: user.id, item_id: item.id)
  end
end