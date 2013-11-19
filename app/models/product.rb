class Product < ActiveRecord::Base
  attr_accessible :adress, :category, :highprice, :price, :quantity, :storeName, :title, :user_id, :unit

  validates_presence_of :price, :quantity, :title, :storeName, :unit

  belongs_to :user
end
