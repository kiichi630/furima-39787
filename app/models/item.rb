class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :area
  belongs_to :shipping_cost
  belongs_to :shipping_day

  validates :product, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :area_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
end
