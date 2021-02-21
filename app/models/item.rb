class Item < ApplicationRecord
  has_one    :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge_burden
  belongs_to :prefecture
  belongs_to :day
end
