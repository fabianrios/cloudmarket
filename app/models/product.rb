class Product < ActiveRecord::Base
  attr_accessible :adress, :category, :highprice, :price, :quantity, :storeName, :title, :user_id

  belongs_to :user
end
