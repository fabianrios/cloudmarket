class Product < ActiveRecord::Base
  attr_accessible :adress, :category, :highprice, :price, :quantity, :storeName, :title
end
