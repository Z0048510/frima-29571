class PurchaseShopping
  include ActiveModel::Mode
  attr_accessor :product_id, :user_id, :postnumber, :area_id, :municipality, :address, :buildingname, :phonenumber

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :postnumber, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :area_id
    validates :municipality
    validates :address
    validates :phonenumber, format: {with: /\A[0-9]*\z/, message: "Input only number"}
  end

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Shopping.create(purchase_id: purchase.id, postnumber: postnumber, area_id: area_id, municipality: municipality, address: address, buildingname: buildingname, phonenumber: phonenumber)
  end
end