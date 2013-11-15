class StoreController < ApplicationController


  def index
    @products = Product.where(user_id: 1)
    @to_products = Product.where(user_id: 2)
    # was @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
