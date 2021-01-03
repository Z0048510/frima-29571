class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :payment
  belongs_to :status

  with_options presence: true do
    validates :productname
    validates :description
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :day_id
    validates :amount
  end
  validates :amount, numericality: {greater_than_or_equal_to: 300, message: "Price Out of setting range"}
  validates :amount, numericality: {less_than_or_equal_to: 9999999, message: "Price Out of setting range"}
end
