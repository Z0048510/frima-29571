class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :payment
  belongs_to :day
  belongs_to :status
  has_many :messages

  with_options presence: true do
    validates :image
    validates :productname
    validates :description
    validates :amount, format: { with: /\A[0-9]{3,7}\z/i, message: 'Half-width number' },
                       numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  with_options presence: { message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :day_id
  end
  # validates :amount, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
