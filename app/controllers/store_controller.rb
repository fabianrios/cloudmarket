class StoreController < ApplicationController


  def index
    @products = Product.all
    @users = User.all
    # was @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
