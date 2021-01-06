class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
end
