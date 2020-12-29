class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :distribution_fee
  belongs_to :region
  belongs_to :term

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :distribution_fee_id, presence: true
  validates :region_id, presence: true
  validates :distribution_term_id, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price, inclusion: { in: 300..9999999 }
  end
  validates :distribution_term_id, presence: true

  validates :genre_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :distribution_id, numericality: { other_than: 1 }
  validates :region_genre_id, numericality: { other_than: 1 }
  validates :term_id, numericality: { other_than: 1 }

end
