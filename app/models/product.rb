class Product < ApplicationRecord
    has_one_attached :image
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
