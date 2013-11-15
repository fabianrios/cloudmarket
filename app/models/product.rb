class Product < ActiveRecord::Base
  attr_accessible :adress, :category, :highprice, :price, :quantity, :storeName, :title, :user_id

  validates_presence_of :price, :quantity, :title, :storeName

  belongs_to :user
end
