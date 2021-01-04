class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :distribution_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :term

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :name
  validates :introduction
  end

  with_options numericality: { other_than: 1 } do
  validates :genre_id
  validates :status_id
  validates :distribution_id
  validates :region_id
  validates :term_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' },
                    numericality: { greater_than: 299, less_than: 100_000_000 }
end
