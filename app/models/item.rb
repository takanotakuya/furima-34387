class Item < ApplicationRecord
  has_one    :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_burden_id
    validates :prefecture_id
    validates :day_id
  end
  validates :price, numericality: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge_burden
  belongs_to :prefecture
  belongs_to :day
end
