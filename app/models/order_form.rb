class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area_id, :municipalities, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。ハイフンを含めてください" }
    validates :area_id, numericality: { other_than: 1, messages: "を選択してください" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は無効です。ハイフンを含めないでください" }
    validates :token
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end