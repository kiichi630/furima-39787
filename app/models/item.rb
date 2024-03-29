class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :area
  belongs_to :shipping_cost
  belongs_to :shipping_day

  validates :image, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :price, in:300..9999999
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "を選択してください" }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "を選択してください" }
  validates :area_id, presence: true, numericality: { other_than: 1 ,message: "を選択したください" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 , message: "を選択してください" }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "を選択してください" }
end
