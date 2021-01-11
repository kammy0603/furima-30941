class Order < ApplicationRecord
  belongs_to :purchase
  has_one :address
end
