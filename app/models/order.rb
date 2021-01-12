class Order < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true
  belongs_to :purchase
end
