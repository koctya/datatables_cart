class Product < ActiveRecord::Base

  has_many :line_items

  validates :name, :desc, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

end
