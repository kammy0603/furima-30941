class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :address, :building_number, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '-を使用してください' }
    validates :prefecture
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: '半角数字を使用してください' }
    validates :token
  end
  with_options numericality: { other_than: 0 } do
    validates :prefecture
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(purchase_id: purchase.id, 
                 postal_code: postal_code, 
                 prefecture: prefecture, 
                 municipalities: municipalities,
                 address: address, 
                 building_number: building_number, 
                 phone_number: phone_number)
  end
end
