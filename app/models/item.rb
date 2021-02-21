class Item < ApplicationRecord
  has_one    :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :description
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :charge_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :price
  validates :day_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge_burden
  belongs_to :prefecture
  belongs_to :day
end
