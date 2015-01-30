class User < ActiveRecord::Base

  has_many :orders

  validates :name, :email, :address, presence: true
  validates :name, uniqueness: true

end
