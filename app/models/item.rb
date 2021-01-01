class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :distribution_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :term

  belongs_to :user
  has_one_attached :image

  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :introduction,          presence: true

  validates :genre_id,        numericality: { other_than: 1 }
  validates :status_id,       numericality: { other_than: 1 }
  validates :distribution_id, numericality: { other_than: 1 }
  validates :region_id,       numericality: { other_than: 1 }
  validates :term_id,         numericality: { other_than: 1 }

  #with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }, numericality: { greater_than: 300, less_than: 9999999 }
    #inclusion: { in: 300..9_999_999 }
  #end


end
